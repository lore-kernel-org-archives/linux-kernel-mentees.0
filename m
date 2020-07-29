Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9B4C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 08:11:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B332070B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 08:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4uqbyW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B332070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA02E8829B;
	Wed, 29 Jul 2020 08:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeB0E2yX7Nwt; Wed, 29 Jul 2020 08:11:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 313C18820B;
	Wed, 29 Jul 2020 08:11:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19514C004F;
	Wed, 29 Jul 2020 08:11:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F7D1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 08:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5741E85FD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 08:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVdvhCP2_lmg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 08:11:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F081A85F9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 08:11:17 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id l4so23314739ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/t5pNySee6OqbzQZAWjwnDIE2zX5dn9rOcmBRRLPlS8=;
 b=J4uqbyW3DPYAUqprlCh0mjjkrOfnI1IdYmwCrBeG2W65C0YQh0YigGyEcTMv9TDaop
 8+QysujUGb0/8unyd0iqLKEwEdc946YOUxRiSlm+RU1Ju8vBvRUSPN8is8QDCRFOQx0E
 SrNfNRy2JCfDMO8HUm6w/dPrM/FCBnhiGt2SpsQmanyif6KVet48HHt2I/wtjtHg07PB
 MUhZCuQoOZjS8OxmXiOwvfKOwxIEWCGnNRk+cgVlTVcyQ+VqfXZ1t0757ByUglvRoyIo
 gf//kssY6kJxGZ8ArKMzAwR1m2pPRFra3X1mxkjgLJKRwhmPPHIk8xtAbCIX5cB1L0U8
 lW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=/t5pNySee6OqbzQZAWjwnDIE2zX5dn9rOcmBRRLPlS8=;
 b=trAESgzebRyEWn0VwQY65Ewga5mAa+xUAjn3K8+RcwjWZZdLvBSknTSRwqB9grIM/W
 8NDZWpNOgISeQnJKxz7gKjT5ZVepX2MBYRsxuef7GmuGJ6w7ZvY4fG89w4vo2Pn8byPw
 3GAMjlbQUMqTSL5ypfYiS+rT0bzA139B3LdOf9lf0TQwJ+WJgnP1YPswdo0017wzX4o0
 dNP++Y17ZVktLIdm7j5VnvSQKh0fsePDjxBddL3Sv/6jUOQLzQsKimDjtJT2YbIfQDp7
 rCTt1ZZJ1TknZq5la4dyvTh27qhswzVjmGGBE+z5gFUu9te/rxwO1HfnbBycBW29GBTc
 ajSg==
X-Gm-Message-State: AOAM533PyXqQXkeznwmXa/dNGWNdtn0nsLVeaBWSYFUsWcuKInuH9BtK
 UlZjC5lo7xHmyIk6CnWzDGA=
X-Google-Smtp-Source: ABdhPJx/ggMPCH51IrftsK9y1cPgkhUv+R069m7jS3KRVy9umySSHs81sjQixsJujPoFa5MRXG/wNw==
X-Received: by 2002:a17:906:a253:: with SMTP id
 bi19mr28201798ejb.338.1596010276279; 
 Wed, 29 Jul 2020 01:11:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v2sm1166890edb.95.2020.07.29.01.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 01:11:15 -0700 (PDT)
To: Peilin Ye <yepeilin.cs@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200728192924.441570-1-yepeilin.cs@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <30b2a31f-77c2-56c1-ecde-875c6eea99d5@gmail.com>
Date: Wed, 29 Jul 2020 10:11:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728192924.441570-1-yepeilin.cs@gmail.com>
Content-Language: en-US
Cc: Leo Liu <leo.liu@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Trek <trek00@inbox.ru>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Evan Quan <evan.quan@amd.com>, linux-kernel-mentees@lists.linuxfoundation.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

QW0gMjguMDcuMjAgdW0gMjE6Mjkgc2NocmllYiBQZWlsaW4gWWU6Cj4gQ29tcGlsZXIgbGVhdmVz
IGEgNC1ieXRlIGhvbGUgbmVhciB0aGUgZW5kIG9mIGBkZXZfaW5mb2AsIGNhdXNpbmcKPiBhbWRn
cHVfaW5mb19pb2N0bCgpIHRvIGNvcHkgdW5pbml0aWFsaXplZCBrZXJuZWwgc3RhY2sgbWVtb3J5
IHRvIHVzZXJzcGFjZQo+IHdoZW4gYHNpemVgIGlzIGdyZWF0ZXIgdGhhbiAzNTYuCj4KPiBJbiAy
MDE1IHdlIHRyaWVkIHRvIGZpeCB0aGlzIGlzc3VlIGJ5IGRvaW5nIGA9IHt9O2Agb24gYGRldl9p
bmZvYCwgd2hpY2gKPiB1bmZvcnR1bmF0ZWx5IGRvZXMgbm90IGluaXRpYWxpemUgdGhhdCA0LWJ5
dGUgaG9sZS4gRml4IGl0IGJ5IHVzaW5nCj4gbWVtc2V0KCkgaW5zdGVhZC4KPgo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IGMxOTNmYTkxYjkxOCAoImRybS9hbWRncHU6IGlu
Zm9ybWF0aW9uIGxlYWsgaW4gYW1kZ3B1X2luZm9faW9jdGwoKSIpCj4gRml4ZXM6IGQzOGNlYWY5
OWVkMCAoImRybS9hbWRncHU6IGFkZCBjb3JlIGRyaXZlciAodjQpIikKPiBTdWdnZXN0ZWQtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBQZWlsaW4gWWUgPHllcGVpbGluLmNzQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpJIGNhbid0IGNvdW50IGhvdyBt
YW55IG9mIHRob3NlIHdlIGhhdmUgZml4ZWQgb3ZlciB0aGUgeWVhcnMuCgpBdCBzb21lIHBvaW50
IHdlIHNob3VsZCBwcm9iYWJseSBkb2N1bWVudCB0aGF0IHVzaW5nICI9IHt9IiBvciAiPSB7IDAg
fSIgCmluIHRoZSBrZXJuZWwgaXMgYSByZWFsbHkgYmFkIGlkZWEgYW5kIHNob3VsZCBiZSBhdm9p
ZGVkLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+IC0tLQo+ICQgcGFob2xlIC1DICJkcm1fYW1kZ3B1
X2luZm9fZGV2aWNlIiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLm8KPiBz
dHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2RldmljZSB7Cj4gCV9fdTMyICAgICAgICAgICAgICAgICAg
ICAgIGRldmljZV9pZDsgICAgICAgICAgICAvKiAgICAgMCAgICAgNCAqLwo+IAlfX3UzMiAgICAg
ICAgICAgICAgICAgICAgICBjaGlwX3JldjsgICAgICAgICAgICAgLyogICAgIDQgICAgIDQgKi8K
PiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgZXh0ZXJuYWxfcmV2OyAgICAgICAgIC8qICAg
ICA4ICAgICA0ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIHBjaV9yZXY7ICAgICAg
ICAgICAgICAvKiAgICAxMiAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAgICAgICBm
YW1pbHk7ICAgICAgICAgICAgICAgLyogICAgMTYgICAgIDQgKi8KPiAJX191MzIgICAgICAgICAg
ICAgICAgICAgICAgbnVtX3NoYWRlcl9lbmdpbmVzOyAgIC8qICAgIDIwICAgICA0ICovCj4gCV9f
dTMyICAgICAgICAgICAgICAgICAgICAgIG51bV9zaGFkZXJfYXJyYXlzX3Blcl9lbmdpbmU7IC8q
ICAgIDI0ICAgICA0ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIGdwdV9jb3VudGVy
X2ZyZXE7ICAgICAvKiAgICAyOCAgICAgNCAqLwo+IAlfX3U2NCAgICAgICAgICAgICAgICAgICAg
ICBtYXhfZW5naW5lX2Nsb2NrOyAgICAgLyogICAgMzIgICAgIDggKi8KPiAJX191NjQgICAgICAg
ICAgICAgICAgICAgICAgbWF4X21lbW9yeV9jbG9jazsgICAgIC8qICAgIDQwICAgICA4ICovCj4g
CV9fdTMyICAgICAgICAgICAgICAgICAgICAgIGN1X2FjdGl2ZV9udW1iZXI7ICAgICAvKiAgICA0
OCAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAgICAgICBjdV9hb19tYXNrOyAgICAg
ICAgICAgLyogICAgNTIgICAgIDQgKi8KPiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgY3Vf
Yml0bWFwWzRdWzRdOyAgICAgIC8qICAgIDU2ICAgIDY0ICovCj4gCS8qIC0tLSBjYWNoZWxpbmUg
MSBib3VuZGFyeSAoNjQgYnl0ZXMpIHdhcyA1NiBieXRlcyBhZ28gLS0tICovCj4gCV9fdTMyICAg
ICAgICAgICAgICAgICAgICAgIGVuYWJsZWRfcmJfcGlwZXNfbWFzazsgLyogICAxMjAgICAgIDQg
Ki8KPiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgbnVtX3JiX3BpcGVzOyAgICAgICAgIC8q
ICAgMTI0ICAgICA0ICovCj4gCS8qIC0tLSBjYWNoZWxpbmUgMiBib3VuZGFyeSAoMTI4IGJ5dGVz
KSAtLS0gKi8KPiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgbnVtX2h3X2dmeF9jb250ZXh0
czsgIC8qICAgMTI4ICAgICA0ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIF9wYWQ7
ICAgICAgICAgICAgICAgICAvKiAgIDEzMiAgICAgNCAqLwo+IAlfX3U2NCAgICAgICAgICAgICAg
ICAgICAgICBpZHNfZmxhZ3M7ICAgICAgICAgICAgLyogICAxMzYgICAgIDggKi8KPiAJX191NjQg
ICAgICAgICAgICAgICAgICAgICAgdmlydHVhbF9hZGRyZXNzX29mZnNldDsgLyogICAxNDQgICAg
IDggKi8KPiAJX191NjQgICAgICAgICAgICAgICAgICAgICAgdmlydHVhbF9hZGRyZXNzX21heDsg
IC8qICAgMTUyICAgICA4ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIHZpcnR1YWxf
YWRkcmVzc19hbGlnbm1lbnQ7IC8qICAgMTYwICAgICA0ICovCj4gCV9fdTMyICAgICAgICAgICAg
ICAgICAgICAgIHB0ZV9mcmFnbWVudF9zaXplOyAgICAvKiAgIDE2NCAgICAgNCAqLwo+IAlfX3Uz
MiAgICAgICAgICAgICAgICAgICAgICBnYXJ0X3BhZ2Vfc2l6ZTsgICAgICAgLyogICAxNjggICAg
IDQgKi8KPiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgY2VfcmFtX3NpemU7ICAgICAgICAg
IC8qICAgMTcyICAgICA0ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIHZyYW1fdHlw
ZTsgICAgICAgICAgICAvKiAgIDE3NiAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAg
ICAgICB2cmFtX2JpdF93aWR0aDsgICAgICAgLyogICAxODAgICAgIDQgKi8KPiAJX191MzIgICAg
ICAgICAgICAgICAgICAgICAgdmNlX2hhcnZlc3RfY29uZmlnOyAgIC8qICAgMTg0ICAgICA0ICov
Cj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIGdjX2RvdWJsZV9vZmZjaGlwX2xkc19idWY7
IC8qICAgMTg4ICAgICA0ICovCj4gCS8qIC0tLSBjYWNoZWxpbmUgMyBib3VuZGFyeSAoMTkyIGJ5
dGVzKSAtLS0gKi8KPiAJX191NjQgICAgICAgICAgICAgICAgICAgICAgcHJpbV9idWZfZ3B1X2Fk
ZHI7ICAgIC8qICAgMTkyICAgICA4ICovCj4gCV9fdTY0ICAgICAgICAgICAgICAgICAgICAgIHBv
c19idWZfZ3B1X2FkZHI7ICAgICAvKiAgIDIwMCAgICAgOCAqLwo+IAlfX3U2NCAgICAgICAgICAg
ICAgICAgICAgICBjbnRsX3NiX2J1Zl9ncHVfYWRkcjsgLyogICAyMDggICAgIDggKi8KPiAJX191
NjQgICAgICAgICAgICAgICAgICAgICAgcGFyYW1fYnVmX2dwdV9hZGRyOyAgIC8qICAgMjE2ICAg
ICA4ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIHByaW1fYnVmX3NpemU7ICAgICAg
ICAvKiAgIDIyNCAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAgICAgICBwb3NfYnVm
X3NpemU7ICAgICAgICAgLyogICAyMjggICAgIDQgKi8KPiAJX191MzIgICAgICAgICAgICAgICAg
ICAgICAgY250bF9zYl9idWZfc2l6ZTsgICAgIC8qICAgMjMyICAgICA0ICovCj4gCV9fdTMyICAg
ICAgICAgICAgICAgICAgICAgIHBhcmFtX2J1Zl9zaXplOyAgICAgICAvKiAgIDIzNiAgICAgNCAq
Lwo+IAlfX3UzMiAgICAgICAgICAgICAgICAgICAgICB3YXZlX2Zyb250X3NpemU7ICAgICAgLyog
ICAyNDAgICAgIDQgKi8KPiAJX191MzIgICAgICAgICAgICAgICAgICAgICAgbnVtX3NoYWRlcl92
aXNpYmxlX3ZncHJzOyAvKiAgIDI0NCAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAg
ICAgICBudW1fY3VfcGVyX3NoOyAgICAgICAgLyogICAyNDggICAgIDQgKi8KPiAJX191MzIgICAg
ICAgICAgICAgICAgICAgICAgbnVtX3RjY19ibG9ja3M7ICAgICAgIC8qICAgMjUyICAgICA0ICov
Cj4gCS8qIC0tLSBjYWNoZWxpbmUgNCBib3VuZGFyeSAoMjU2IGJ5dGVzKSAtLS0gKi8KPiAJX191
MzIgICAgICAgICAgICAgICAgICAgICAgZ3Nfdmd0X3RhYmxlX2RlcHRoOyAgIC8qICAgMjU2ICAg
ICA0ICovCj4gCV9fdTMyICAgICAgICAgICAgICAgICAgICAgIGdzX3ByaW1fYnVmZmVyX2RlcHRo
OyAvKiAgIDI2MCAgICAgNCAqLwo+IAlfX3UzMiAgICAgICAgICAgICAgICAgICAgICBtYXhfZ3Nf
d2F2ZXNfcGVyX3ZndDsgLyogICAyNjQgICAgIDQgKi8KPiAJX191MzIgICAgICAgICAgICAgICAg
ICAgICAgX3BhZDE7ICAgICAgICAgICAgICAgIC8qICAgMjY4ICAgICA0ICovCj4gCV9fdTMyICAg
ICAgICAgICAgICAgICAgICAgIGN1X2FvX2JpdG1hcFs0XVs0XTsgICAvKiAgIDI3MiAgICA2NCAq
Lwo+IAkvKiAtLS0gY2FjaGVsaW5lIDUgYm91bmRhcnkgKDMyMCBieXRlcykgd2FzIDE2IGJ5dGVz
IGFnbyAtLS0gKi8KPiAJX191NjQgICAgICAgICAgICAgICAgICAgICAgaGlnaF92YV9vZmZzZXQ7
ICAgICAgIC8qICAgMzM2ICAgICA4ICovCj4gCV9fdTY0ICAgICAgICAgICAgICAgICAgICAgIGhp
Z2hfdmFfbWF4OyAgICAgICAgICAvKiAgIDM0NCAgICAgOCAqLwo+IAlfX3UzMiAgICAgICAgICAg
ICAgICAgICAgICBwYV9zY190aWxlX3N0ZWVyaW5nX292ZXJyaWRlOyAvKiAgIDM1MiAgICAgNCAq
Lwo+Cj4gCS8qIFhYWCA0IGJ5dGVzIGhvbGUsIHRyeSB0byBwYWNrICovCj4KPiAJX191NjQgICAg
ICAgICAgICAgICAgICAgICAgdGNjX2Rpc2FibGVkX21hc2s7ICAgIC8qICAgMzYwICAgICA4ICov
Cj4KPiAJLyogc2l6ZTogMzY4LCBjYWNoZWxpbmVzOiA2LCBtZW1iZXJzOiA0OSAqLwo+IAkvKiBz
dW0gbWVtYmVyczogMzY0LCBob2xlczogMSwgc3VtIGhvbGVzOiA0ICovCj4gCS8qIGxhc3QgY2Fj
aGVsaW5lOiA0OCBieXRlcyAqLwo+IH07Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9rbXMuYyB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
Cj4gaW5kZXggYThjNDdhZWNkMzQyLi4wMDQ3ZGEwNjA0MWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4gQEAgLTcwNyw5ICs3MDcsMTAgQEAgc3RhdGljIGlu
dCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBz
dHJ1Y3QgZHJtX2ZpbGUKPiAgIAkJcmV0dXJuIG4gPyAtRUZBVUxUIDogMDsKPiAgIAl9Cj4gICAJ
Y2FzZSBBTURHUFVfSU5GT19ERVZfSU5GTzogewo+IC0JCXN0cnVjdCBkcm1fYW1kZ3B1X2luZm9f
ZGV2aWNlIGRldl9pbmZvID0ge307Cj4gKwkJc3RydWN0IGRybV9hbWRncHVfaW5mb19kZXZpY2Ug
ZGV2X2luZm87Cj4gICAJCXVpbnQ2NF90IHZtX3NpemU7Cj4gICAKPiArCQltZW1zZXQoJmRldl9p
bmZvLCAwLCBzaXplb2YoZGV2X2luZm8pKTsKPiAgIAkJZGV2X2luZm8uZGV2aWNlX2lkID0gZGV2
LT5wZGV2LT5kZXZpY2U7Cj4gICAJCWRldl9pbmZvLmNoaXBfcmV2ID0gYWRldi0+cmV2X2lkOwo+
ICAgCQlkZXZfaW5mby5leHRlcm5hbF9yZXYgPSBhZGV2LT5leHRlcm5hbF9yZXZfaWQ7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
