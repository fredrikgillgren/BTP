using btp.fs as bf from '../db/schema';

service FullStackService {

    @odata.draft.enabled
    entity Employee as select from bf.EMPLOYEE;

    entity Address as select from bf.ADDRESS;

    entity Project as select from bf.PROJECT;

    entity ProjectRoles as select from bf.PROJECTROLES;

}
