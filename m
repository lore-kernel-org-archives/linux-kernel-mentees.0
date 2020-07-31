Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CE6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 07:34:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6312074B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 07:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6312074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DA949214FD;
	Fri, 31 Jul 2020 07:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtMS8+MF+NVB; Fri, 31 Jul 2020 07:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 23AB320395;
	Fri, 31 Jul 2020 07:34:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00962C0050;
	Fri, 31 Jul 2020 07:34:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09999C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF8818876A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoT0XEQiSkS3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:34:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E234888763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:34:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MF3Y8-1jzFqY4Bg0-00FT5F for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 Jul 2020 09:34:31
 +0200
Received: by mail-qk1-f169.google.com with SMTP id l64so21182587qkb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 00:34:30 -0700 (PDT)
X-Gm-Message-State: AOAM531iZOPmj0L95qk+0fqKqsWUChnhu/btHhg7nZ9niyOCh2lrJZG9
 f4sR7hIZXEsmDDZa6nzLD/K8uGV3oDjgbJeIQKQ=
X-Google-Smtp-Source: ABdhPJxYk3wIyoxiO9LUCf/QsYM6dUKOpKBu16SsDD6IATmeJ5ingRMD/m8u2OxTjlKcCpmR5ojXc2QcoL/2khVzoU8=
X-Received: by 2002:a37:b942:: with SMTP id j63mr2753181qkf.138.1596180869243; 
 Fri, 31 Jul 2020 00:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200728192924.441570-1-yepeilin.cs@gmail.com>
 <30b2a31f-77c2-56c1-ecde-875c6eea99d5@gmail.com>
 <CADnq5_NXOiAc7q5gQqF_wwtJD1o6nHjXM4O3gY6EwAQe9iOtXw@mail.gmail.com>
 <8c5cf518-12d2-7495-7822-c7ebf8e61972@amd.com>
In-Reply-To: <8c5cf518-12d2-7495-7822-c7ebf8e61972@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 31 Jul 2020 09:34:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+Vv5=bKDR=NU8jcNgAoZRk+EKG11NU7bQSetyVDvn=w@mail.gmail.com>
Message-ID: <CAK8P3a2+Vv5=bKDR=NU8jcNgAoZRk+EKG11NU7bQSetyVDvn=w@mail.gmail.com>
To: Luben Tuikov <luben.tuikov@amd.com>
X-Provags-ID: V03:K1:xbfdJ12La5D2ut7DnCOxKO72FBtzHuTyOBKAti0n6Pygmmy2Df9
 s/rGoGFhFyB+T0LMeKuVsQW79RrWxNuzn2swINJXJn1WU7TN8axoLAQlQowugRptHjbfyKU
 4Iu/tDq5C+es7WRV+ioc6ux/yggaQDKvRih+PbpblcAoV4i/WhmLEK7HaLK/0jn0n1Qg0gm
 Qnh9abeCkqMIwohVZgUzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TUCPiN0wCBQ=:RW4wmA8nZMfhuwzk/S6My4
 i8F5hD7e7Zbe9RJu8tUTFJan5tFAGcdCbi1YVjKsq7oS9+eTfClHwRaez7b1QRElGm4IFOD7l
 38a+TNrlM+zO2+yBD76Oihcjc3Qu5L/YVuWQIlpyNww3Q8zcKITOXwMTFm7OIMpXREK+sYAKG
 ME3LyFu1afm7FjblfgUDEZ5eGYoo6VgPp6mWHoOE8K7c2ponvRN/Ue7IDpDppeNE2b6WdGIim
 HQjfkiAehmyU6cq1SMNsa3PvNnWQPy2ZkDAm4FeJCc58XzHguivHGNj4R1S99jar5Zlg92IO1
 FFTqFcdX4Haoq74oNkGGk2MlnWtlXaKkwrd0yivHoR/kOgGm1uBv55WEmJNXJ0+lr9aInC+bq
 Y5PtLM/Tl07VF0vaqKbmCdWm2kYjVwscceW7uGfSoPYLSqChLmAKhox1aLroPf9Ly8OjD+jF9
 UhIf5LCTDPAS95cMEpN4J3WNjcEx477m0QcGHhD3YORFQuC5WGfyCnHeQYaZ52eTD7XgAyxMJ
 hqrQK+W95vY5jR+LVTp0mJ1/PO6zCvhKTR6uxlEUvsVBQjrHbLGrCQavvDAw1c/EWa6u+JD3c
 7tHyO2IJJh3f5QawVNaw8rkLr3rJ4NzAcgMZYQnWJT6C9qlZsNlghD+pApvCBJuf6CcRH08Wj
 NCZEecZqCJ7E+k4nxHhAyLvUNXkTCZkr/FF+VavXfN5MjSkf53eqlZRkbuw25Vwpi/nMQBpE6
 nKYGiZutDBIe34fUR0iuCyuY5rBA2fekQp++C9JonpNpRbJRHzehtEszERPdJQ41wzSWE64Vy
 B7ahg+hwlscv7eZ9CLW7kQ8czCT7HVLqP1iNMhBDtsB7pgj6k/vCGBXQ5Xz5okvDDCGPX7+di
 ZZVGNGNmL2TIfYaEFSIcreEj+WZYc0HKcRWpROrtoc/T7G8YQS+oL7o8TPcqjrGswJylxq5yz
 R3ciEIKqmpHb7RKEaMa8IWvSHg3GRdUJMhJ0XP9drABsioR1rCJ3f
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Trek <trek00@inbox.ru>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peilin Ye <yepeilin.cs@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Leo Liu <leo.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/amdgpu: Prevent
 kernel-infoleak in amdgpu_info_ioctl()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMTE6MDkgUE0gTHViZW4gVHVpa292IDxsdWJlbi50dWlr
b3ZAYW1kLmNvbT4gd3JvdGU6Cj4gT24gMjAyMC0wNy0yOSA5OjQ5IGEubS4sIEFsZXggRGV1Y2hl
ciB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDI5LCAyMDIwIGF0IDQ6MTEgQU0gQ2hyaXN0aWFuIEvD
tm5pZwo+ID4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+
ID4+IEFtIDI4LjA3LjIwIHVtIDIxOjI5IHNjaHJpZWIgUGVpbGluIFllOgo+ID4+PiBDb21waWxl
ciBsZWF2ZXMgYSA0LWJ5dGUgaG9sZSBuZWFyIHRoZSBlbmQgb2YgYGRldl9pbmZvYCwgY2F1c2lu
Zwo+ID4+PiBhbWRncHVfaW5mb19pb2N0bCgpIHRvIGNvcHkgdW5pbml0aWFsaXplZCBrZXJuZWwg
c3RhY2sgbWVtb3J5IHRvIHVzZXJzcGFjZQo+ID4+PiB3aGVuIGBzaXplYCBpcyBncmVhdGVyIHRo
YW4gMzU2Lgo+ID4+Pgo+ID4+PiBJbiAyMDE1IHdlIHRyaWVkIHRvIGZpeCB0aGlzIGlzc3VlIGJ5
IGRvaW5nIGA9IHt9O2Agb24gYGRldl9pbmZvYCwgd2hpY2gKPiA+Pj4gdW5mb3J0dW5hdGVseSBk
b2VzIG5vdCBpbml0aWFsaXplIHRoYXQgNC1ieXRlIGhvbGUuIEZpeCBpdCBieSB1c2luZwo+ID4+
PiBtZW1zZXQoKSBpbnN0ZWFkLgo+ID4+Pgo+ID4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+ID4+PiBGaXhlczogYzE5M2ZhOTFiOTE4ICgiZHJtL2FtZGdwdTogaW5mb3JtYXRpb24gbGVh
ayBpbiBhbWRncHVfaW5mb19pb2N0bCgpIikKPiA+Pj4gRml4ZXM6IGQzOGNlYWY5OWVkMCAoImRy
bS9hbWRncHU6IGFkZCBjb3JlIGRyaXZlciAodjQpIikKPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6
IFBlaWxpbiBZZSA8eWVwZWlsaW4uY3NAZ21haWwuY29tPgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+Pgo+ID4+IEkg
Y2FuJ3QgY291bnQgaG93IG1hbnkgb2YgdGhvc2Ugd2UgaGF2ZSBmaXhlZCBvdmVyIHRoZSB5ZWFy
cy4KPiA+Pgo+ID4+IEF0IHNvbWUgcG9pbnQgd2Ugc2hvdWxkIHByb2JhYmx5IGRvY3VtZW50IHRo
YXQgdXNpbmcgIj0ge30iIG9yICI9IHsgMCB9Igo+ID4+IGluIHRoZSBrZXJuZWwgaXMgYSByZWFs
bHkgYmFkIGlkZWEgYW5kIHNob3VsZCBiZSBhdm9pZGVkLgo+ID4KPiA+IE1vcmVvdmVyLCBpdCBz
ZWVtcyBsaWtlIGRpZmZlcmVudCBjb21waWxlcnMgc2VlbSB0byBiZWhhdmUgcmVsYXRpdmVseQo+
ID4gZGlmZmVyZW50bHkgd2l0aCB0aGVzZSBhbmQgd2Ugb2Z0ZW4gZ2V0IHJlcG9ydHMgb2Ygd2Fy
bmluZ3Mgd2l0aCB0aGVzZQo+ID4gb24gY2xhbmcuICBXaGVuIGluIGRvdWJ0LCBtZW1zZXQuCj4K
PiBUaGVyZSBhcmUgcXVpdGUgYSBmZXcgb2YgdGhvc2UgdW5kZXIgZHJpdmVycy9ncHUvZHJtLCBm
b3IgImFtZC8iLCAic2NoZWR1bGVyLyIKPiBkcm0qLmMgZmlsZXMsCj4KPiAkZmluZCAuIFwoIC1y
ZWdleCAiLi9kcm0uKlwuYyIgLW9yIC1yZWdleCAiLi9hbWQvLipcLmMiIC1vciAtcmVnZXggIi4v
c2NoZWR1bGVyLy4qXC5jIiBcKSAtZXhlYyBlZ3JlcCAtbiAtLSAiICo9ICp7ICoofE5VTEx8MCkg
Kn0iIFx7XH0gXCsgfCB3YyAtbAo+IDM3NAo+ICRfCj4KPiBPdXQgb2Ygd2hpY2ggb25seSAxNiBh
cmUgb2YgdGhlIG5vbi1JU08gQyB2YXJpZXR5LCAiPSB7fSIsCj4KPiAkZmluZCAuIFwoIC1yZWdl
eCAiLi9kcm0uKlwuYyIgLW9yIC1yZWdleCAiLi9hbWQvLipcLmMiIC1vciAtcmVnZXggIi4vc2No
ZWR1bGVyLy4qXC5jIiBcKSAtZXhlYyBlZ3JlcCAtbiAtLSAiICo9ICp7ICp9IiBce1x9IFwrIHwg
d2MgLWwKPiAxNgo+ICRfCgpUaGF0IGlzIGFuIHVucmVsYXRlZCBpc3N1ZSwgdGhvc2Ugd2VyZSBp
bnRyb2R1Y2VkIHRvIGRlYWwgd2l0aCBvbGRlciBjb21waWxlcnMKdGhhdCBkbyBub3QgYWNjZXB0
ICd7MH0nIGFzIGFuIGluaXRpYWxpemVyIGZvciBhbiBhZ2dyZWdhdGUgd2hvc2UKZmlyc3QgbWVt
YmVyIGlzCmFub3RoZXIgYWdncmVnYXRlLiBHZW5lcmFsbHkgc3BlYWtpbmcsICc9IHsgfScgaXMg
YmV0dGVyIHRvIHVzZSBpbiB0aGUKa2VybmVsIHRoYW4KJz0geyAwIH0nIGJlY2F1c2UgYWxsIHN1
cHBvcnRlZCBjb21waWxlcnMgaW50ZXJwcmV0IHRoYXQgdGhlIHNhbWUgd2F5IGZvciBhbGwKc3Ry
dWN0dXJlcy4KCiAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
