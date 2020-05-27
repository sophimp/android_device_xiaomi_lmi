/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::init::property_set;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[],
    char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void load_lmiglobal() {
    property_override("ro.product.model", "Redmi K30 Pro");
    property_override("ro.build.product", "lmi");
    property_override("ro.product.device", "lmi");
    property_override("ro.build.description", "qssi-user 10 QKQ1.191117.002 V11.0.16.0.QJKCNXM release-keys");
    property_override("ro.control_privapp_permissions", "log");
}

void load_lmiin() {
    property_override("ro.product.model", "Redmi K30 Pro");
    property_override("ro.build.product", "lmiin");
    property_override("ro.product.device", "lmiin");
    property_override("ro.build.description", "qssi-user 10 QKQ1.191117.002 V11.0.16.0.QJKCNXM release-keys");
    property_override("ro.control_privapp_permissions", "log");
}

void load_lmi() {
    property_override("ro.product.model", "Redmi K30 Pro");
    property_override("ro.build.product", "lmi");
    property_override("ro.product.device", "lmi");
    property_override("ro.build.description", "qssi-user 10 QKQ1.191117.002 V11.0.16.0.QJKCNXM release-keys");
    property_override("ro.control_privapp_permissions", "log");
}


void vendor_load_properties() {
    std::string region = android::base::GetProperty("ro.boot.hwc", "");

    if (region.find("CN") != std::string::npos) {
        load_lmi();
    } else if (region.find("INDIA") != std::string::npos) {
        load_lmiin();
    } else if (region.find("GLOBAL") != std::string::npos) {
        load_lmiglobal();
    } else {
        LOG(ERROR) << __func__ << ": unexcepted region!";
    }
    property_override("ro.vendor.build.fingerprint", "google/coral/coral:10/QQ2A.200501.001.B2/6352890:user/release-keys");
    property_override("ro.build.fingerprint", "google/coral/coral:10/QQ2A.200501.001.B2/6352890:user/release-keys");
}
