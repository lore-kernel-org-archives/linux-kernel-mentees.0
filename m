Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60543C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 15:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6B15400EF;
	Mon, 30 Oct 2023 15:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B15400EF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C24gnB9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPnhgEwXMMqg; Mon, 30 Oct 2023 15:52:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 64040400C7;
	Mon, 30 Oct 2023 15:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64040400C7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27173C0071;
	Mon, 30 Oct 2023 15:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2A13C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8017A4081F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 15:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8017A4081F
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C24gnB9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_daBkJveoBb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 15:52:31 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B3274071E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 15:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3274071E
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99357737980so732173166b.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698681149; x=1699285949;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qcBEi1lBI38DN/iPYBUEKFD33e1P8VGGwEZLkT86i0o=;
 b=C24gnB9AEhgaHiM1C5vcjaSdQ90/z+CW9jh9PTnx9f5f7YCfZHQOanDeb/G4baPqRs
 M5aWu1tr6mHr2EDR6wWxNlSYdYxXCUJBp9h6pqOTu3BRuvChclvHN63n7HsqqOxAsgoX
 28/NhRBN7xf75Cu3hbEGRYkHPyzn0y9Ptfs1Bf3mafzq5gEbEqyjPPpYV440hYFxKs98
 nXt1LtH+gBc5N3F/halWbo1aHQ+jX07Vzf614i00H+EHPVJP1M+6b8ai6ZDXwO1sqFQb
 1gmK/9Seo6nwZ2SvPoUTOVUSXNZqJLYXk68/YTt2j32/1h7Ytt6YXUz1tMAzcpowLNnq
 1Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698681149; x=1699285949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qcBEi1lBI38DN/iPYBUEKFD33e1P8VGGwEZLkT86i0o=;
 b=K6A4DJZa4X/cmzvlXio093f6EezevUtTpb4wfcthvvhUoW9i1EQqs8kFfjnfdQohTp
 fKw6XQrmH0cI0DgOr7Vx8fQu0um31UP8cfzENuLGWC1TeQUlCfYX/McQx9Hh89aIsQkV
 FlgNH/Mnr1fCsUjyv5piPpe9qDioyt/kcbWPIPRRoFh/kbtzLqFNY48NKEpwlHcbzA5u
 gizdnb8uM1yXah7UhALYunT7601WaIeezJi2lubqQ5Hf9eT5tK0QTdE5sZHGhUyCks7l
 8x3MO/QOiE4Ji2qwBKOMacBDwNBi4Aew2USzRjzs6brmWnDMoDtYIiACLPjI4Hydrnv/
 c9Bg==
X-Gm-Message-State: AOJu0YxW051yaK3M9l5gSsLqOmnt/6EUIU8SfwPmVo/oWKuC6ejTwp8m
 k6BQyfgP7I2dus/s/kqQeSE=
X-Google-Smtp-Source: AGHT+IGlois2Urfp4DO3dHoJNYIFRP6cbF1tyrafdH0gLp9u4cmMpfl/mWbX2MVvH6o1Af4Rzoxv1A==
X-Received: by 2002:a17:906:80da:b0:9d3:ccd1:a922 with SMTP id
 a26-20020a17090680da00b009d3ccd1a922mr2329078ejx.58.1698681149064; 
 Mon, 30 Oct 2023 08:52:29 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.60.47])
 by smtp.gmail.com with ESMTPSA id
 lo10-20020a170906fa0a00b00993a37aebc5sm6100891ejb.50.2023.10.30.08.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 08:52:28 -0700 (PDT)
Message-ID: <403a0750-361e-4218-8c83-a085966349e4@gmail.com>
Date: Mon, 30 Oct 2023 16:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Content-Language: en-US
To: Yuran Pereira <yuran.pereira@hotmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
 <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
 <39ab34ec-209d-4176-b271-1a02e2976497@amd.com>
 <DB3PR10MB6835311E66539604DD442CBBE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DB3PR10MB6835311E66539604DD442CBBE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

QW0gMjguMTAuMjMgdW0gMDI6NDggc2NocmllYiBZdXJhbiBQZXJlaXJhOgo+IEhlbGxvLAo+IE9u
IEZyaSwgT2N0IDI3LCAyMDIzIGF0IDExOjU3OjQ1QU0gLTA0MDAsIEhhbXphIE1haGZvb3ogd3Jv
dGU6Cj4+IE9uIDEwLzI3LzIzIDExOjU1LCBMYWtoYSwgQmhhd2FucHJlZXQgd3JvdGU6Cj4+PiBb
QU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0KPj4+Cj4+Pgo+Pj4KPj4+IFRoZXJlIHdh
cyBhIGNvbnNlbnN1cyB0byB1c2UgbWVtc2V0IGluc3RlYWQgb2YgezB9LiBJIHJlbWVtYmVyIG1h
a2luZwo+Pj4gY2hhbmdlcyByZWxhdGVkIHRvIHRoYXQgcHJldmlvdXNseS4KPj4gSG0sIHNlZW1z
IGxpa2UgaXQncyB1c2VkIHJhdGhlciBjb25zaXN0ZW50bHkgaW4gdGhlIERNIGFuZCBpbiBEQwo+
PiB0aG91Z2guCj4+Cj4gSGF2ZSB5b3UgZGVjaWRlZCB3aGljaCBvbmUgc2hvdWxkIGJlIHVzZWQ/
Cj4KPiBTaG91bGQgSSBzdWJtaXQgYSB2MiBwYXRjaCB1c2luZyB7MH0gaW5zdGVhZCBvZiBtZW1z
ZXQ/CgpUaGUgcHJvYmxlbSBpcyB0aGF0IHswfSBkb2Vzbid0IGluaXRpYWxpemUgcGFkZGluZyBm
aWVsZHMgaW4gc3RydWN0dXJlcy4KClNvIHdoYXQgY2FuIGhhcHBlbiBhcmUgcHJvYmxlbXMgbGlr
ZSBsZWFraW5nIGJ5dGVzIHRvIHVzZXJzcGFjZSBvciAKZ2V0dGluZyB1bnN0YWJsZSBoYXNoIGtl
eXMgZXRjLi4uCgpTbyBJIHRoaW5rIG1lbXNldCgpIGlzIHVzdWFsbHkgcHJlZmVycmVkIGFuZCB0
aGF0IG5vdCBvbmx5IGNvdW50cyBmb3IgTGludXguCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4K
PiBZdXJhbiBQZXJlaXJhCj4+PiBCaGF3YW4KPj4+Cj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICpG
cm9tOiogTWFoZm9veiwgSGFtemEgPEhhbXphLk1haGZvb3pAYW1kLmNvbT4KPj4+ICpTZW50Oiog
T2N0b2JlciAyNywgMjAyMyAxMTo1MyBBTQo+Pj4gKlRvOiogWXVyYW4gUGVyZWlyYSA8eXVyYW4u
cGVyZWlyYUBob3RtYWlsLmNvbT47IGFpcmxpZWRAZ21haWwuY29tCj4+PiA8YWlybGllZEBnbWFp
bC5jb20+Cj4+PiAqQ2M6KiBMaSwgU3VuIHBlbmcgKExlbykgPFN1bnBlbmcuTGlAYW1kLmNvbT47
IExha2hhLCBCaGF3YW5wcmVldAo+Pj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgU2lxdWVpcmEsCj4+PiBSb2RyaWdvIDxSb2Ry
aWdvLlNpcXVlaXJhQGFtZC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+PiA8
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+PiA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+PiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IERl
dWNoZXIsIEFsZXhhbmRlcgo+Pj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcs
IENocmlzdGlhbgo+Pj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47Cj4+PiBsaW51eC1rZXJu
ZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCj4+PiA8bGludXgta2VybmVsLW1l
bnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZz4KPj4+ICpTdWJqZWN0OiogUmU6IFtQQVRD
SF0gZHJtL2FtZGdwdTogRml4ZXMgdW5pbml0aWFsaXplZCB2YXJpYWJsZSB1c2FnZSBpbgo+Pj4g
YW1kZ3B1X2RtX3NldHVwX3JlcGxheQo+Pj4gT24gMTAvMjYvMjMgMTc6MjUsIFl1cmFuIFBlcmVp
cmEgd3JvdGU6Cj4+Pj4gU2luY2UgYHByX2NvbmZpZ2AgaXMgbm90IGluaXRpYWxpemVkIGFmdGVy
IGl0cyBkZWNsYXJhdGlvbiwgdGhlCj4+Pj4gZm9sbG93aW5nIG9wZXJhdGlvbnMgd2l0aCBgcmVw
bGF5X2VuYWJsZV9vcHRpb25gIG1heSBiZSBwZXJmb3JtZWQKPj4+PiB3aGVuIGByZXBsYXlfZW5h
YmxlX29wdGlvbmAgaXMgaG9sZGluZyBqdW5rIHZhbHVlcyB3aGljaCBjb3VsZAo+Pj4+IHBvc3Np
Ymx5IGxlYWQgdG8gdW5kZWZpbmVkIGJlaGF2aW91cgo+Pj4+Cj4+Pj4gYGBgCj4+Pj4gIMKgwqDC
oMKgwqAgLi4uCj4+Pj4gIMKgwqDCoMKgwqAgcHJfY29uZmlnLnJlcGxheV9lbmFibGVfb3B0aW9u
IHw9IHByX2VuYWJsZV9vcHRpb25fc3RhdGljX3NjcmVlbjsKPj4+PiAgwqDCoMKgwqDCoCAuLi4K
Pj4+Pgo+Pj4+ICDCoMKgwqDCoMKgIGlmICghcHJfY29uZmlnLnJlcGxheV90aW1pbmdfc3luY19z
dXBwb3J0ZWQpCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9jb25maWcucmVwbGF5X2VuYWJs
ZV9vcHRpb24gJj0gfnByX2VuYWJsZV9vcHRpb25fZ2VuZXJhbF91aTsKPj4+PiAgwqDCoMKgwqDC
oCAuLi4KPj4+PiBgYGAKPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggaW5pdGlhbGl6ZXMgYHByX2NvbmZp
Z2AgYWZ0ZXIgaXRzIGRlY2xhcmF0aW9uIHRvIGVuc3VyZSB0aGF0Cj4+Pj4gaXQgZG9lc24ndCBj
b250YWluIGp1bmsgZGF0YSwgYW5kIHByZXZlbnQgYW55IHVuZGVmaW5lZCBiZWhhdmlvdXIKPj4+
Pgo+Pj4+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTU0NDQyOCAoIlVuaW5pdGlhbGl6ZWQgc2Nh
bGFyIHZhcmlhYmxlIikKPj4+PiBGaXhlczogZGVkZTFmZWE0NDYwICgiZHJtL2FtZC9kaXNwbGF5
OiBBZGQgRnJlZXN5bmMgUGFuZWwgRE0gY29kZSIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVyYW4g
UGVyZWlyYSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiAgwqDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9yZXBsYXkuYyB8
IDMgKysrCj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX3JlcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fcmVwbGF5LmMKPj4+PiBpbmRleCAzMmQzMDg2YzRjYjcuLjQwNTI2NTA3ZjUwYiAx
MDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9yZXBsYXkuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX3JlcGxheS5jCj4+Pj4gQEAgLTIzLDYgKzIzLDcgQEAKPj4+PiAg
wqDCoMKgICoKPj4+PiAgwqDCoMKgICovCj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4K
Pj4+PiAgwqDCoCAjaW5jbHVkZSAiYW1kZ3B1X2RtX3JlcGxheS5oIgo+Pj4+ICDCoMKgICNpbmNs
dWRlICJkYy5oIgo+Pj4+ICDCoMKgICNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCj4+Pj4gQEAgLTc0
LDYgKzc1LDggQEAgYm9vbCBhbWRncHVfZG1fc2V0dXBfcmVwbGF5KHN0cnVjdCBkY19saW5rICps
aW5rLCBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWMKPj4+PiAgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHJlcGxheV9jb25maWcgcHJfY29uZmlnOwo+Pj4gSSB3b3VsZCBwcmVmZXIgc2V0dGlu
ZyBwcl9jb25maWcgPSB7MH07Cj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoCB1bmlvbiByZXBsYXlf
ZGVidWdfZmxhZ3MgKmRlYnVnX2ZsYWdzID0gTlVMTDsKPj4+PiArwqDCoMKgwqAgbWVtc2V0KCZw
cl9jb25maWcsIDAsIHNpemVvZihwcl9jb25maWcpKTsKPj4+PiArCj4+Pj4gIMKgwqDCoMKgwqDC
oMKgIC8vIEZvciBlRFAsIGlmIFJlcGxheSBpcyBzdXBwb3J0ZWQsIHJldHVybiB0cnVlIHRvIHNr
aXAgY2hlY2tzCj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGlmIChsaW5rLT5yZXBsYXlfc2V0dGluZ3Mu
Y29uZmlnLnJlcGxheV9zdXBwb3J0ZWQpCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gdHJ1ZTsKPj4+IC0tIAo+Pj4gSGFtemEKPj4+Cj4+IC0tIAo+PiBIYW16YQo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
a2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
