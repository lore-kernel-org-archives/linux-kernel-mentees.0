Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52906C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 06:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24FA61343;
	Tue,  7 Nov 2023 06:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24FA61343
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FhwEceCg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTylA3IV53Ic; Tue,  7 Nov 2023 06:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EDBD61342;
	Tue,  7 Nov 2023 06:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDBD61342
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69BBFC0039;
	Tue,  7 Nov 2023 06:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE783C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 06:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 958C48243B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 06:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958C48243B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FhwEceCg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzFLzq57Imol
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 06:03:53 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5A4D8212E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 06:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A4D8212E
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-51f64817809so488916a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 22:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699337033; x=1699941833;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lKFEEOwu+JwvBa63rAI+zxMPRAeyFot/drhB3OU5pF8=;
 b=FhwEceCgLSZaxPlVD/m1fogm5reOGAOcDLVt4cod18CuegHrNkGMOHJ88aUouHISZ9
 KASu0WDEPLgpAa2VmJkGrY21LZw5y/5QZfAm9Uuqcoss3xj6tQr1dQhyisxrfOQzecK1
 tlp0GBUJc9PiSryCyRuzqXzokzimd6BFgLmfStu/D85LlXY6q/qDeKDRUJtej0K6xCX5
 NNWIzBku/ZBTjpC0zy6XEViseuTbZiK1KYqcEvXK60tfeqgntfxLuzF8I21NG8zWJNqM
 cCOPDJiBpzATaCFJ2gWOzxHwb52dVTFjOp5IuaP3tgL4tunGLVbEsf9DG95L6A663EOt
 ZEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699337033; x=1699941833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKFEEOwu+JwvBa63rAI+zxMPRAeyFot/drhB3OU5pF8=;
 b=wArozEt5Koqew5tXMf/VIchEtSLB6VuyKp8Mhh8NcTdMlHszQSK4VpW4c+QlxBmxeT
 kMEileYjdU+Kf0ALFIa2MFOC+qtugHLMyoC6xxP6jx3KxeZ5/PCCEAOQzLEdvobOaZ8m
 a/lhB9xWf0QkHCuVbj6EXNcukplalRy6ubaurFQcaraPa5CMSclDAYhc/Q/rX8eX6o+T
 LZja4K8RsJYx4MxvKAJRXKiIpq2TtnrI+1auI/+XcG06ShT7HjY6o952SJLwhl5bPw6y
 Z5kCwF9QRgvnY7nQUxdaBlbUv9j4Aq+DOTYg69+LNP3jhLPDAJv8dvGHf7XSQ5ERHB/k
 vynQ==
X-Gm-Message-State: AOJu0Yy9Mxvbd7TAvo2MfhwNSMJ7JCrkfhiKIZQ1TGRKWN6SioJyjhaA
 1vO80ILW+TrVJs/kv+FbtPs=
X-Google-Smtp-Source: AGHT+IEYjDnHlZaeLjHfEXLGnwRtpD+SbIvNxQUtdUAz9T0ERhq0lqVvZiRjtyeTQBeHaCk0XeNZnw==
X-Received: by 2002:a17:903:32d2:b0:1cc:32c6:e5fa with SMTP id
 i18-20020a17090332d200b001cc32c6e5famr28596508plr.6.1699337032527; 
 Mon, 06 Nov 2023 22:03:52 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.209])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a170902c38900b001c726147a45sm6840474plg.190.2023.11.06.22.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 22:03:52 -0800 (PST)
Message-ID: <d252d281-96a5-404c-a6a2-fbaa65bea28a@gmail.com>
Date: Tue, 7 Nov 2023 11:33:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
 <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
 <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
Cc: airlied@gmail.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
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

T24gMTEvNy8yMyAwMzowNywgQWxleCBEZXVjaGVyIHdyb3RlOgo+IE9uIE1vbiwgTm92IDYsIDIw
MjMgYXQgNDoyMOKAr1BNIEFiaGluYXYgU2luZ2gKPiA8c2luZ2hhYmhpbmF2OTA1MTU3MTgzM0Bn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS83LzIzIDAwOjI1LCBBbGV4IERldWNoZXIgd3Jv
dGU6Cj4+PiBBcHBsaWVkLiAgVGhpcyBtYXRjaGVzIHdoYXQgd2UgYWxyZWFkeSBkbyBpbiB0aGUg
b3RoZXIgY2xlYXIgc3RhdGUgaGVhZGVycy4KPj4+Cj4+PiBBbGV4Cj4+Pgo+Pj4gT24gRnJpLCBO
b3YgMywgMjAyMyBhdCAxMjowMOKAr1BNIEFiaGluYXYgU2luZ2gKPj4+IDxzaW5naGFiaGluYXY5
MDUxNTcxODMzQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBzcGFyc2Ugc3RhdGljIGFuYWx5
c2lzIHRvb2xzIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoIHRoaXMgbWVzc2FnZQo+Pj4+ICJVc2lu
ZyBwbGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlciIuIEluIHRoaXMgY2FzZSB0aGlzIHdhcm5p
bmcgaXMKPj4+PiBiZWluZyBzaG93biBiZWNhdXNlIHdlIGFyZSB0cnlpbmcgdG8gaW50aWFsaXpl
IGEgcG9pbnRlciB0byBOVUxMIHVzaW5nCj4+Pj4gaW50ZWdlciB2YWx1ZSAwLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogQWJoaW5hdiBTaW5naCA8c2luZ2hhYmhpbmF2OTA1MTU3MTgzM0BnbWFp
bC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0YXRl
X2V2ZXJncmVlbi5oIHwgOCArKysrLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5oIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5oCj4+Pj4gaW5kZXggNjNhMWZmYmIzY2VkLi4zYjY0
NTU1OGYxMzMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0
YXRlX2V2ZXJncmVlbi5oCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0
YXRlX2V2ZXJncmVlbi5oCj4+Pj4gQEAgLTEwNDksNyArMTA0OSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgY3NfZXh0ZW50X2RlZiBTRUNUX0NPTlRFWFRfZGVmc1tdID0KPj4+PiAgICAgICAge1NF
Q1RfQ09OVEVYVF9kZWZfNSwgMHgwMDAwYTI5ZSwgNSB9LAo+Pj4+ICAgICAgICB7U0VDVF9DT05U
RVhUX2RlZl82LCAweDAwMDBhMmE1LCA1NiB9LAo+Pj4+ICAgICAgICB7U0VDVF9DT05URVhUX2Rl
Zl83LCAweDAwMDBhMmRlLCAyOTAgfSwKPj4+PiAtICAgIHsgMCwgMCwgMCB9Cj4+Pj4gKyAgICB7
IE5VTEwsIDAsIDAgfQo+Pj4+ICAgIH07Cj4+Pj4gICAgc3RhdGljIGNvbnN0IHUzMiBTRUNUX0NM
RUFSX2RlZl8xW10gPQo+Pj4+ICAgIHsKPj4+PiBAQCAtMTA2MCw3ICsxMDYwLDcgQEAgc3RhdGlj
IGNvbnN0IHUzMiBTRUNUX0NMRUFSX2RlZl8xW10gPQo+Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY3NfZXh0ZW50X2RlZiBTRUNUX0NMRUFSX2RlZnNbXSA9Cj4+Pj4gICAgewo+Pj4+ICAgICAg
ICB7U0VDVF9DTEVBUl9kZWZfMSwgMHgwMDAwZmZjMCwgMyB9LAo+Pj4+IC0gICAgeyAwLCAwLCAw
IH0KPj4+PiArICAgIHsgTlVMTCwgMCwgMCB9Cj4+Pj4gICAgfTsKPj4+PiAgICBzdGF0aWMgY29u
c3QgdTMyIFNFQ1RfQ1RSTENPTlNUX2RlZl8xW10gPQo+Pj4+ICAgIHsKPj4+PiBAQCAtMTA3MCwx
MSArMTA3MCwxMSBAQCBzdGF0aWMgY29uc3QgdTMyIFNFQ1RfQ1RSTENPTlNUX2RlZl8xW10gPQo+
Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3NfZXh0ZW50X2RlZiBTRUNUX0NUUkxDT05TVF9k
ZWZzW10gPQo+Pj4+ICAgIHsKPj4+PiAgICAgICAge1NFQ1RfQ1RSTENPTlNUX2RlZl8xLCAweDAw
MDBmM2ZjLCAyIH0sCj4+Pj4gLSAgICB7IDAsIDAsIDAgfQo+Pj4+ICsgICAgeyBOVUxMLCAwLCAw
IH0KPj4+PiAgICB9Owo+Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3Nfc2VjdGlvbl9kZWYg
ZXZlcmdyZWVuX2NzX2RhdGFbXSA9IHsKPj4+PiAgICAgICAgeyBTRUNUX0NPTlRFWFRfZGVmcywg
U0VDVF9DT05URVhUIH0sCj4+Pj4gICAgICAgIHsgU0VDVF9DTEVBUl9kZWZzLCBTRUNUX0NMRUFS
IH0sCj4+Pj4gICAgICAgIHsgU0VDVF9DVFJMQ09OU1RfZGVmcywgU0VDVF9DVFJMQ09OU1QgfSwK
Pj4+PiAtICAgIHsgMCwgU0VDVF9OT05FIH0KPj4+PiArICAgIHsgTlVMTCwgU0VDVF9OT05FIH0K
Pj4+PiAgICB9Owo+Pj4+IC0tCj4+Pj4gMi4zOS4yCj4+Pj4KPj4gSGkgQWxleCwgdGhhbmtzIGZv
ciBsb29raW5nIGludG8gdGhpcy4gQnkgYXBwbGllZCB5b3UgbWVhbiB0aGlzIHBhdGNoIGlzCj4+
IGFjY2VwdGVkIGFuZCBpdCBoYXMgYmVlbiBtZXJnZWQ/Cj4gCj4gWWVzLiAgT25jZSBpdCBtYWtl
cyBpdCB0aHJvdWdoIG91ciBDSSBzeXN0ZW0sIGl0IHdpbGwgc2hvdyB1cCBpbiBteQo+IGRybS1u
ZXh0IHRyZWUuCj4gCj4gQWxleApPa2F5LCB0aGlzIGlzIG15IGZpcnN0IHBhdGNoIHRvIGdldCBp
bnRvIGtlcm5lbCA6KQpUaGFuayB5b3Ugb25jZSBhZ2FpbiBmb3IgeW91ciB0aW1lIHdpdGggdGhp
cyBwYXRjaCBhbmQgYWNjZXB0aW5nIGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgt
a2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
