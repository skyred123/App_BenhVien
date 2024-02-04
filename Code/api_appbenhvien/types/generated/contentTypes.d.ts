import type { Schema, Attribute } from '@strapi/strapi';

export interface AdminPermission extends Schema.CollectionType {
  collectionName: 'admin_permissions';
  info: {
    name: 'Permission';
    description: '';
    singularName: 'permission';
    pluralName: 'permissions';
    displayName: 'Permission';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    action: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    actionParameters: Attribute.JSON & Attribute.DefaultTo<{}>;
    subject: Attribute.String &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    properties: Attribute.JSON & Attribute.DefaultTo<{}>;
    conditions: Attribute.JSON & Attribute.DefaultTo<[]>;
    role: Attribute.Relation<'admin::permission', 'manyToOne', 'admin::role'>;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'admin::permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'admin::permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface AdminUser extends Schema.CollectionType {
  collectionName: 'admin_users';
  info: {
    name: 'User';
    description: '';
    singularName: 'user';
    pluralName: 'users';
    displayName: 'User';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    firstname: Attribute.String &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    lastname: Attribute.String &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    username: Attribute.String;
    email: Attribute.Email &
      Attribute.Required &
      Attribute.Private &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 6;
      }>;
    password: Attribute.Password &
      Attribute.Private &
      Attribute.SetMinMaxLength<{
        minLength: 6;
      }>;
    resetPasswordToken: Attribute.String & Attribute.Private;
    registrationToken: Attribute.String & Attribute.Private;
    isActive: Attribute.Boolean &
      Attribute.Private &
      Attribute.DefaultTo<false>;
    roles: Attribute.Relation<'admin::user', 'manyToMany', 'admin::role'> &
      Attribute.Private;
    blocked: Attribute.Boolean & Attribute.Private & Attribute.DefaultTo<false>;
    preferedLanguage: Attribute.String;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<'admin::user', 'oneToOne', 'admin::user'> &
      Attribute.Private;
    updatedBy: Attribute.Relation<'admin::user', 'oneToOne', 'admin::user'> &
      Attribute.Private;
  };
}

export interface AdminRole extends Schema.CollectionType {
  collectionName: 'admin_roles';
  info: {
    name: 'Role';
    description: '';
    singularName: 'role';
    pluralName: 'roles';
    displayName: 'Role';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.Required &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    code: Attribute.String &
      Attribute.Required &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    description: Attribute.String;
    users: Attribute.Relation<'admin::role', 'manyToMany', 'admin::user'>;
    permissions: Attribute.Relation<
      'admin::role',
      'oneToMany',
      'admin::permission'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<'admin::role', 'oneToOne', 'admin::user'> &
      Attribute.Private;
    updatedBy: Attribute.Relation<'admin::role', 'oneToOne', 'admin::user'> &
      Attribute.Private;
  };
}

export interface AdminApiToken extends Schema.CollectionType {
  collectionName: 'strapi_api_tokens';
  info: {
    name: 'Api Token';
    singularName: 'api-token';
    pluralName: 'api-tokens';
    displayName: 'Api Token';
    description: '';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.Required &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    description: Attribute.String &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }> &
      Attribute.DefaultTo<''>;
    type: Attribute.Enumeration<['read-only', 'full-access', 'custom']> &
      Attribute.Required &
      Attribute.DefaultTo<'read-only'>;
    accessKey: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    lastUsedAt: Attribute.DateTime;
    permissions: Attribute.Relation<
      'admin::api-token',
      'oneToMany',
      'admin::api-token-permission'
    >;
    expiresAt: Attribute.DateTime;
    lifespan: Attribute.BigInteger;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'admin::api-token',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'admin::api-token',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface AdminApiTokenPermission extends Schema.CollectionType {
  collectionName: 'strapi_api_token_permissions';
  info: {
    name: 'API Token Permission';
    description: '';
    singularName: 'api-token-permission';
    pluralName: 'api-token-permissions';
    displayName: 'API Token Permission';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    action: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    token: Attribute.Relation<
      'admin::api-token-permission',
      'manyToOne',
      'admin::api-token'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'admin::api-token-permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'admin::api-token-permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface AdminTransferToken extends Schema.CollectionType {
  collectionName: 'strapi_transfer_tokens';
  info: {
    name: 'Transfer Token';
    singularName: 'transfer-token';
    pluralName: 'transfer-tokens';
    displayName: 'Transfer Token';
    description: '';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.Required &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    description: Attribute.String &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }> &
      Attribute.DefaultTo<''>;
    accessKey: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    lastUsedAt: Attribute.DateTime;
    permissions: Attribute.Relation<
      'admin::transfer-token',
      'oneToMany',
      'admin::transfer-token-permission'
    >;
    expiresAt: Attribute.DateTime;
    lifespan: Attribute.BigInteger;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'admin::transfer-token',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'admin::transfer-token',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface AdminTransferTokenPermission extends Schema.CollectionType {
  collectionName: 'strapi_transfer_token_permissions';
  info: {
    name: 'Transfer Token Permission';
    description: '';
    singularName: 'transfer-token-permission';
    pluralName: 'transfer-token-permissions';
    displayName: 'Transfer Token Permission';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    action: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 1;
      }>;
    token: Attribute.Relation<
      'admin::transfer-token-permission',
      'manyToOne',
      'admin::transfer-token'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'admin::transfer-token-permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'admin::transfer-token-permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginUploadFile extends Schema.CollectionType {
  collectionName: 'files';
  info: {
    singularName: 'file';
    pluralName: 'files';
    displayName: 'File';
    description: '';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String & Attribute.Required;
    alternativeText: Attribute.String;
    caption: Attribute.String;
    width: Attribute.Integer;
    height: Attribute.Integer;
    formats: Attribute.JSON;
    hash: Attribute.String & Attribute.Required;
    ext: Attribute.String;
    mime: Attribute.String & Attribute.Required;
    size: Attribute.Decimal & Attribute.Required;
    url: Attribute.String & Attribute.Required;
    previewUrl: Attribute.String;
    provider: Attribute.String & Attribute.Required;
    provider_metadata: Attribute.JSON;
    related: Attribute.Relation<'plugin::upload.file', 'morphToMany'>;
    folder: Attribute.Relation<
      'plugin::upload.file',
      'manyToOne',
      'plugin::upload.folder'
    > &
      Attribute.Private;
    folderPath: Attribute.String &
      Attribute.Required &
      Attribute.Private &
      Attribute.SetMinMax<{
        min: 1;
      }>;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::upload.file',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::upload.file',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginUploadFolder extends Schema.CollectionType {
  collectionName: 'upload_folders';
  info: {
    singularName: 'folder';
    pluralName: 'folders';
    displayName: 'Folder';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMax<{
        min: 1;
      }>;
    pathId: Attribute.Integer & Attribute.Required & Attribute.Unique;
    parent: Attribute.Relation<
      'plugin::upload.folder',
      'manyToOne',
      'plugin::upload.folder'
    >;
    children: Attribute.Relation<
      'plugin::upload.folder',
      'oneToMany',
      'plugin::upload.folder'
    >;
    files: Attribute.Relation<
      'plugin::upload.folder',
      'oneToMany',
      'plugin::upload.file'
    >;
    path: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMax<{
        min: 1;
      }>;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::upload.folder',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::upload.folder',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginUsersPermissionsPermission
  extends Schema.CollectionType {
  collectionName: 'up_permissions';
  info: {
    name: 'permission';
    description: '';
    singularName: 'permission';
    pluralName: 'permissions';
    displayName: 'Permission';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    action: Attribute.String & Attribute.Required;
    role: Attribute.Relation<
      'plugin::users-permissions.permission',
      'manyToOne',
      'plugin::users-permissions.role'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::users-permissions.permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::users-permissions.permission',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginUsersPermissionsRole extends Schema.CollectionType {
  collectionName: 'up_roles';
  info: {
    name: 'role';
    description: '';
    singularName: 'role';
    pluralName: 'roles';
    displayName: 'Role';
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 3;
      }>;
    description: Attribute.String;
    type: Attribute.String & Attribute.Unique;
    permissions: Attribute.Relation<
      'plugin::users-permissions.role',
      'oneToMany',
      'plugin::users-permissions.permission'
    >;
    users: Attribute.Relation<
      'plugin::users-permissions.role',
      'oneToMany',
      'plugin::users-permissions.user'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::users-permissions.role',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::users-permissions.role',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginUsersPermissionsUser extends Schema.CollectionType {
  collectionName: 'up_users';
  info: {
    name: 'user';
    description: '';
    singularName: 'user';
    pluralName: 'users';
    displayName: 'User';
  };
  options: {
    draftAndPublish: false;
  };
  attributes: {
    username: Attribute.String &
      Attribute.Required &
      Attribute.Unique &
      Attribute.SetMinMaxLength<{
        minLength: 3;
      }>;
    email: Attribute.Email &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 6;
      }>;
    provider: Attribute.String;
    password: Attribute.Password &
      Attribute.Private &
      Attribute.SetMinMaxLength<{
        minLength: 6;
      }>;
    resetPasswordToken: Attribute.String & Attribute.Private;
    confirmationToken: Attribute.String & Attribute.Private;
    confirmed: Attribute.Boolean & Attribute.DefaultTo<false>;
    blocked: Attribute.Boolean & Attribute.DefaultTo<false>;
    role: Attribute.Relation<
      'plugin::users-permissions.user',
      'manyToOne',
      'plugin::users-permissions.role'
    >;
    thong_bao: Attribute.Relation<
      'plugin::users-permissions.user',
      'oneToOne',
      'api::thong-bao.thong-bao'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::users-permissions.user',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::users-permissions.user',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface PluginI18NLocale extends Schema.CollectionType {
  collectionName: 'i18n_locale';
  info: {
    singularName: 'locale';
    pluralName: 'locales';
    collectionName: 'locales';
    displayName: 'Locale';
    description: '';
  };
  options: {
    draftAndPublish: false;
  };
  pluginOptions: {
    'content-manager': {
      visible: false;
    };
    'content-type-builder': {
      visible: false;
    };
  };
  attributes: {
    name: Attribute.String &
      Attribute.SetMinMax<{
        min: 1;
        max: 50;
      }>;
    code: Attribute.String & Attribute.Unique;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'plugin::i18n.locale',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'plugin::i18n.locale',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiCtLichKhamCtLichKham extends Schema.CollectionType {
  collectionName: 'ct_lich_khams';
  info: {
    singularName: 'ct-lich-kham';
    pluralName: 'ct-lich-khams';
    displayName: 'CT_LichKham';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    ngaykham: Attribute.Date;
    ho_so_bac_si: Attribute.Relation<
      'api::ct-lich-kham.ct-lich-kham',
      'manyToOne',
      'api::ho-so-bac-si.ho-so-bac-si'
    >;
    thoi_gian_kham: Attribute.Relation<
      'api::ct-lich-kham.ct-lich-kham',
      'manyToOne',
      'api::thoi-gian-kham.thoi-gian-kham'
    >;
    phieu_dang_ky: Attribute.Relation<
      'api::ct-lich-kham.ct-lich-kham',
      'oneToOne',
      'api::phieu-dang-ky.phieu-dang-ky'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::ct-lich-kham.ct-lich-kham',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::ct-lich-kham.ct-lich-kham',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiHoSoBacSiHoSoBacSi extends Schema.CollectionType {
  collectionName: 'ho_so_bac_sis';
  info: {
    singularName: 'ho-so-bac-si';
    pluralName: 'ho-so-bac-sis';
    displayName: 'HoSo_BacSi';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    HoTen: Attribute.String;
    GioiTinh: Attribute.Boolean;
    KinhNghiem: Attribute.Text;
    DaoTao: Attribute.Text;
    ct_lich_khams: Attribute.Relation<
      'api::ho-so-bac-si.ho-so-bac-si',
      'oneToMany',
      'api::ct-lich-kham.ct-lich-kham'
    >;
    users_permissions_user: Attribute.Relation<
      'api::ho-so-bac-si.ho-so-bac-si',
      'oneToOne',
      'plugin::users-permissions.user'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::ho-so-bac-si.ho-so-bac-si',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::ho-so-bac-si.ho-so-bac-si',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiHoSoBenhNhanHoSoBenhNhan extends Schema.CollectionType {
  collectionName: 'ho_so_benh_nhans';
  info: {
    singularName: 'ho-so-benh-nhan';
    pluralName: 'ho-so-benh-nhans';
    displayName: 'HoSo_BenhNhan';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    HoTen: Attribute.String;
    NgaySinh: Attribute.Date;
    GioiTinh: Attribute.Boolean;
    DiaChi: Attribute.Text;
    phieu_dang_kies: Attribute.Relation<
      'api::ho-so-benh-nhan.ho-so-benh-nhan',
      'oneToMany',
      'api::phieu-dang-ky.phieu-dang-ky'
    >;
    lich_hens: Attribute.Relation<
      'api::ho-so-benh-nhan.ho-so-benh-nhan',
      'oneToMany',
      'api::lich-hen.lich-hen'
    >;
    users_permissions_user: Attribute.Relation<
      'api::ho-so-benh-nhan.ho-so-benh-nhan',
      'oneToOne',
      'plugin::users-permissions.user'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::ho-so-benh-nhan.ho-so-benh-nhan',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::ho-so-benh-nhan.ho-so-benh-nhan',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiLichHenLichHen extends Schema.CollectionType {
  collectionName: 'lich_hens';
  info: {
    singularName: 'lich-hen';
    pluralName: 'lich-hens';
    displayName: 'Lich_Hen';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    ThoiGianHen: Attribute.DateTime;
    NoiDungHen: Attribute.Text;
    TrangThai: Attribute.Integer & Attribute.DefaultTo<0>;
    ho_so_benh_nhan: Attribute.Relation<
      'api::lich-hen.lich-hen',
      'manyToOne',
      'api::ho-so-benh-nhan.ho-so-benh-nhan'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::lich-hen.lich-hen',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::lich-hen.lich-hen',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiPhieuDangKyPhieuDangKy extends Schema.CollectionType {
  collectionName: 'phieu_dang_kies';
  info: {
    singularName: 'phieu-dang-ky';
    pluralName: 'phieu-dang-kies';
    displayName: 'Phieu_DangKy';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    NoiDung: Attribute.Text;
    TrangThai: Attribute.Integer & Attribute.DefaultTo<0>;
    phieu_ho_tro: Attribute.Relation<
      'api::phieu-dang-ky.phieu-dang-ky',
      'oneToOne',
      'api::phieu-ho-tro.phieu-ho-tro'
    >;
    ho_so_benh_nhan: Attribute.Relation<
      'api::phieu-dang-ky.phieu-dang-ky',
      'manyToOne',
      'api::ho-so-benh-nhan.ho-so-benh-nhan'
    >;
    ct_lich_kham: Attribute.Relation<
      'api::phieu-dang-ky.phieu-dang-ky',
      'oneToOne',
      'api::ct-lich-kham.ct-lich-kham'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::phieu-dang-ky.phieu-dang-ky',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::phieu-dang-ky.phieu-dang-ky',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiPhieuHoTroPhieuHoTro extends Schema.CollectionType {
  collectionName: 'phieu_ho_tros';
  info: {
    singularName: 'phieu-ho-tro';
    pluralName: 'phieu-ho-tros';
    displayName: 'Phieu_HoTro';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    ThoiGianLap: Attribute.DateTime;
    TinhTrang: Attribute.Text;
    NoiDung: Attribute.Text;
    KetLuan: Attribute.Text;
    phieu_dang_ky: Attribute.Relation<
      'api::phieu-ho-tro.phieu-ho-tro',
      'oneToOne',
      'api::phieu-dang-ky.phieu-dang-ky'
    >;
    toa_thuoc: Attribute.Relation<
      'api::phieu-ho-tro.phieu-ho-tro',
      'oneToOne',
      'api::toa-thuoc.toa-thuoc'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::phieu-ho-tro.phieu-ho-tro',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::phieu-ho-tro.phieu-ho-tro',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiThoiGianKhamThoiGianKham extends Schema.CollectionType {
  collectionName: 'thoi_gian_khams';
  info: {
    singularName: 'thoi-gian-kham';
    pluralName: 'thoi-gian-khams';
    displayName: 'ThoiGian_Kham';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    GioBatDau: Attribute.Time;
    GioKetThuc: Attribute.Time;
    ct_lich_khams: Attribute.Relation<
      'api::thoi-gian-kham.thoi-gian-kham',
      'oneToMany',
      'api::ct-lich-kham.ct-lich-kham'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::thoi-gian-kham.thoi-gian-kham',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::thoi-gian-kham.thoi-gian-kham',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiThongBaoThongBao extends Schema.CollectionType {
  collectionName: 'thong_baos';
  info: {
    singularName: 'thong-bao';
    pluralName: 'thong-baos';
    displayName: 'Thong_Bao';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    tieude: Attribute.String;
    noidung: Attribute.Text;
    thoigian: Attribute.DateTime;
    token: Attribute.String;
    users_permissions_user: Attribute.Relation<
      'api::thong-bao.thong-bao',
      'oneToOne',
      'plugin::users-permissions.user'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::thong-bao.thong-bao',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::thong-bao.thong-bao',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiThuocThuoc extends Schema.CollectionType {
  collectionName: 'thuocs';
  info: {
    singularName: 'thuoc';
    pluralName: 'thuocs';
    displayName: 'Thuoc';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    TenThuoc: Attribute.Text;
    toa_thuocs: Attribute.Relation<
      'api::thuoc.thuoc',
      'manyToMany',
      'api::toa-thuoc.toa-thuoc'
    >;
    TacDung: Attribute.Blocks;
    LieuDung: Attribute.Blocks;
    TacDungPhu: Attribute.Blocks;
    CanhBao: Attribute.Blocks;
    TuongTacThuoc: Attribute.Blocks;
    KhanCap: Attribute.Blocks;
    BaoQuan: Attribute.Blocks;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::thuoc.thuoc',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::thuoc.thuoc',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

export interface ApiToaThuocToaThuoc extends Schema.CollectionType {
  collectionName: 'toa_thuocs';
  info: {
    singularName: 'toa-thuoc';
    pluralName: 'toa-thuocs';
    displayName: 'Toa_Thuoc';
    description: '';
  };
  options: {
    draftAndPublish: true;
  };
  attributes: {
    NgayLap: Attribute.Date;
    phieu_ho_tro: Attribute.Relation<
      'api::toa-thuoc.toa-thuoc',
      'oneToOne',
      'api::phieu-ho-tro.phieu-ho-tro'
    >;
    thuocs: Attribute.Relation<
      'api::toa-thuoc.toa-thuoc',
      'manyToMany',
      'api::thuoc.thuoc'
    >;
    createdAt: Attribute.DateTime;
    updatedAt: Attribute.DateTime;
    publishedAt: Attribute.DateTime;
    createdBy: Attribute.Relation<
      'api::toa-thuoc.toa-thuoc',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
    updatedBy: Attribute.Relation<
      'api::toa-thuoc.toa-thuoc',
      'oneToOne',
      'admin::user'
    > &
      Attribute.Private;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface ContentTypes {
      'admin::permission': AdminPermission;
      'admin::user': AdminUser;
      'admin::role': AdminRole;
      'admin::api-token': AdminApiToken;
      'admin::api-token-permission': AdminApiTokenPermission;
      'admin::transfer-token': AdminTransferToken;
      'admin::transfer-token-permission': AdminTransferTokenPermission;
      'plugin::upload.file': PluginUploadFile;
      'plugin::upload.folder': PluginUploadFolder;
      'plugin::users-permissions.permission': PluginUsersPermissionsPermission;
      'plugin::users-permissions.role': PluginUsersPermissionsRole;
      'plugin::users-permissions.user': PluginUsersPermissionsUser;
      'plugin::i18n.locale': PluginI18NLocale;
      'api::ct-lich-kham.ct-lich-kham': ApiCtLichKhamCtLichKham;
      'api::ho-so-bac-si.ho-so-bac-si': ApiHoSoBacSiHoSoBacSi;
      'api::ho-so-benh-nhan.ho-so-benh-nhan': ApiHoSoBenhNhanHoSoBenhNhan;
      'api::lich-hen.lich-hen': ApiLichHenLichHen;
      'api::phieu-dang-ky.phieu-dang-ky': ApiPhieuDangKyPhieuDangKy;
      'api::phieu-ho-tro.phieu-ho-tro': ApiPhieuHoTroPhieuHoTro;
      'api::thoi-gian-kham.thoi-gian-kham': ApiThoiGianKhamThoiGianKham;
      'api::thong-bao.thong-bao': ApiThongBaoThongBao;
      'api::thuoc.thuoc': ApiThuocThuoc;
      'api::toa-thuoc.toa-thuoc': ApiToaThuocToaThuoc;
    }
  }
}
