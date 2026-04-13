// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hyrox_app/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i732;
import 'package:hyrox_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i65;
import 'package:hyrox_app/features/auth/domain/repositories/auth_repository.dart'
    as _i1019;
import 'package:hyrox_app/features/auth/domain/usecases/sign_in.dart' as _i803;
import 'package:hyrox_app/features/auth/domain/usecases/sign_up.dart' as _i850;
import 'package:hyrox_app/features/auth/presentation/bloc/auth_bloc.dart'
    as _i31;
import 'package:hyrox_app/features/feed/data/datasources/feed_remote_datasource.dart'
    as _i891;
import 'package:hyrox_app/features/feed/data/repositories/feed_repository_impl.dart'
    as _i195;
import 'package:hyrox_app/features/feed/domain/repositories/feed_repository.dart'
    as _i1024;
import 'package:hyrox_app/features/feed/domain/usecases/get_feed.dart' as _i873;
import 'package:hyrox_app/features/feed/domain/usecases/post_feed.dart'
    as _i146;
import 'package:hyrox_app/features/feed/presentation/bloc/feed_bloc.dart'
    as _i675;
import 'package:hyrox_app/features/profile/data/datasources/profile_remote_datasource.dart'
    as _i215;
import 'package:hyrox_app/features/profile/data/repositories/profile_repository_impl.dart'
    as _i1032;
import 'package:hyrox_app/features/profile/domain/repositories/profile_repository.dart'
    as _i494;
import 'package:hyrox_app/features/profile/domain/usecases/get_profile.dart'
    as _i939;
import 'package:hyrox_app/features/profile/domain/usecases/update_profile.dart'
    as _i35;
import 'package:hyrox_app/features/profile/presentation/bloc/profile_bloc.dart'
    as _i303;
import 'package:hyrox_app/features/ranking/data/datasources/ranking_remote_datasource.dart'
    as _i613;
import 'package:hyrox_app/features/ranking/data/repositories/ranking_repository_impl.dart'
    as _i528;
import 'package:hyrox_app/features/ranking/domain/repositories/ranking_repository.dart'
    as _i657;
import 'package:hyrox_app/features/ranking/domain/usecases/get_ranking.dart'
    as _i207;
import 'package:hyrox_app/features/ranking/presentation/bloc/ranking_bloc.dart'
    as _i510;
import 'package:hyrox_app/features/running/data/datasources/gps_datasource.dart'
    as _i238;
import 'package:hyrox_app/features/running/data/datasources/run_remote_datasource.dart'
    as _i201;
import 'package:hyrox_app/features/running/data/repositories/run_repository_impl.dart'
    as _i19;
import 'package:hyrox_app/features/running/domain/repositories/run_repository.dart'
    as _i84;
import 'package:hyrox_app/features/running/domain/usecases/get_run_stats.dart'
    as _i184;
import 'package:hyrox_app/features/running/domain/usecases/start_run.dart'
    as _i753;
import 'package:hyrox_app/features/running/domain/usecases/stop_run.dart'
    as _i971;
import 'package:hyrox_app/features/running/presentation/bloc/running_bloc.dart'
    as _i937;
import 'package:hyrox_app/features/shape/data/datasources/shape_remote_datasource.dart'
    as _i236;
import 'package:hyrox_app/features/shape/data/repositories/shape_repository_impl.dart'
    as _i911;
import 'package:hyrox_app/features/shape/domain/repositories/shape_repository.dart'
    as _i371;
import 'package:hyrox_app/features/shape/domain/usecases/analyze_shape_similarity.dart'
    as _i628;
import 'package:hyrox_app/features/shape/domain/usecases/create_custom_shape.dart'
    as _i790;
import 'package:hyrox_app/features/shape/presentation/bloc/shape_bloc.dart'
    as _i856;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i201.RunRemoteDataSource>(
      () => _i201.RunRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i891.FeedRemoteDataSource>(
      () => _i891.FeedRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i215.ProfileRemoteDataSource>(
      () => _i215.ProfileRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i236.ShapeRemoteDataSource>(
      () => _i236.ShapeRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i732.AuthRemoteDataSource>(
      () => _i732.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i238.GpsDataSource>(() => _i238.GpsDataSourceImpl());
    gh.lazySingleton<_i613.RankingRemoteDataSource>(
      () => _i613.RankingRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i1019.AuthRepository>(
      () => _i65.AuthRepositoryImpl(gh<_i732.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i371.ShapeRepository>(
      () => _i911.ShapeRepositoryImpl(gh<_i236.ShapeRemoteDataSource>()),
    );
    gh.lazySingleton<_i657.RankingRepository>(
      () => _i528.RankingRepositoryImpl(gh<_i613.RankingRemoteDataSource>()),
    );
    gh.lazySingleton<_i1024.FeedRepository>(
      () => _i195.FeedRepositoryImpl(gh<_i891.FeedRemoteDataSource>()),
    );
    gh.factory<_i803.SignIn>(() => _i803.SignIn(gh<_i1019.AuthRepository>()));
    gh.factory<_i850.SignUp>(() => _i850.SignUp(gh<_i1019.AuthRepository>()));
    gh.lazySingleton<_i494.ProfileRepository>(
      () => _i1032.ProfileRepositoryImpl(gh<_i215.ProfileRemoteDataSource>()),
    );
    gh.factory<_i31.AuthBloc>(
      () => _i31.AuthBloc(gh<_i803.SignIn>(), gh<_i850.SignUp>()),
    );
    gh.factory<_i628.AnalyzeShapeSimilarity>(
      () => _i628.AnalyzeShapeSimilarity(gh<_i371.ShapeRepository>()),
    );
    gh.factory<_i790.CreateCustomShape>(
      () => _i790.CreateCustomShape(gh<_i371.ShapeRepository>()),
    );
    gh.lazySingleton<_i84.RunRepository>(
      () => _i19.RunRepositoryImpl(
        gh<_i238.GpsDataSource>(),
        gh<_i201.RunRemoteDataSource>(),
      ),
    );
    gh.factory<_i207.GetRanking>(
      () => _i207.GetRanking(gh<_i657.RankingRepository>()),
    );
    gh.factory<_i873.GetFeed>(() => _i873.GetFeed(gh<_i1024.FeedRepository>()));
    gh.factory<_i146.PostFeed>(
      () => _i146.PostFeed(gh<_i1024.FeedRepository>()),
    );
    gh.factory<_i510.RankingBloc>(
      () => _i510.RankingBloc(gh<_i207.GetRanking>()),
    );
    gh.factory<_i939.GetProfile>(
      () => _i939.GetProfile(gh<_i494.ProfileRepository>()),
    );
    gh.factory<_i35.UpdateProfile>(
      () => _i35.UpdateProfile(gh<_i494.ProfileRepository>()),
    );
    gh.factory<_i184.GetRunStats>(
      () => _i184.GetRunStats(gh<_i84.RunRepository>()),
    );
    gh.factory<_i753.StartRun>(() => _i753.StartRun(gh<_i84.RunRepository>()));
    gh.factory<_i971.StopRun>(() => _i971.StopRun(gh<_i84.RunRepository>()));
    gh.factory<_i303.ProfileBloc>(
      () => _i303.ProfileBloc(gh<_i939.GetProfile>(), gh<_i35.UpdateProfile>()),
    );
    gh.factory<_i937.RunningBloc>(
      () => _i937.RunningBloc(gh<_i753.StartRun>(), gh<_i971.StopRun>()),
    );
    gh.factory<_i856.ShapeBloc>(
      () => _i856.ShapeBloc(
        gh<_i628.AnalyzeShapeSimilarity>(),
        gh<_i790.CreateCustomShape>(),
      ),
    );
    gh.factory<_i675.FeedBloc>(
      () => _i675.FeedBloc(gh<_i873.GetFeed>(), gh<_i146.PostFeed>()),
    );
    return this;
  }
}
