using btp.fs as bf from '../db/schema';

service FullStackService {

    @odata.draft.enabled
    entity Employee as projection on bf.EMPLOYEE;

    entity Address as projection on bf.ADDRESS;

    entity Project as projection on bf.PROJECT;

    entity ProjectRoles as projection on bf.PROJECTROLES;
}