@EpisodesCtrl = @app.controller 'EpisodesCtrl', ["$scope", "$http", ($scope, $http) ->
	$scope.episodes = []
	$scope.selectedEpisode = null

	$scope.showEpisode = (episode) ->
		$scope.selectedEpisode = episode
		loadVideo(episode)

	$scope.isSelected = (episode) ->
		'active' if $scope.selectedEpisode == episode

	loadVideo = (episode) ->
		$('#player').flowplayer
			playlist: [[mp4: episode.video_url]]
			ratio: 9/14

	loadEpisodes = ->
		$http.get("/api/screencasts.json").success((data, status, header, config) ->
			angular.forEach data, (value) ->
				$scope.episodes.push value
		)

	loadEpisodes()
]