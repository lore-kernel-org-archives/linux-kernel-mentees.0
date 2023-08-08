Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3551C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 23:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE4F60BAC;
	Tue,  8 Aug 2023 23:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE4F60BAC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oy4I54MZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RJjx0MtG1yo; Tue,  8 Aug 2023 23:51:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5733960797;
	Tue,  8 Aug 2023 23:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5733960797
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2745DC0071;
	Tue,  8 Aug 2023 23:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7198C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 23:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB684820E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 23:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB684820E7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oy4I54MZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fnEd_Um9fR9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 23:51:26 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19970820E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 23:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19970820E6
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a7781225b4so3798546b6e.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691538685; x=1692143485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8BP2Tfc3vy3cwSRBFZ2e1oFmyYaIxvroBai/slP3GKA=;
 b=oy4I54MZ8ganu/0JKBY0LhQhTIqQOeeid+0JTq4zCkX0T27cFCqd/n4zCKlu3pq7ea
 0U9rGCU/g9TPOnKVjbZe89IDLSOEx5GyFjBJ1EYeYnGvEIKZpyWw3JFKL+oN9cz9QV2/
 iabpsWWxbLifd0OQd4FLOxgd6brB2u1Y203xUBdEX0B2NrGfHWS3B8ZhgtZAj3eXEOgB
 sChHtX1rafSBpfl+fW10B03dZCHnz1Ty71FK9HBwsNbaHPnQtMi4Fe7BK5RB/5q6iatP
 ZdUKkcREk/vdmE48o1jiLxpBalmolahXNaeaJCnWWgoHs+jiXKtKI+o3itnmvuKakC9S
 zqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691538685; x=1692143485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8BP2Tfc3vy3cwSRBFZ2e1oFmyYaIxvroBai/slP3GKA=;
 b=OEQGwgmL1pzoHMF0Om8SjuJcKUxEMZfNmYe5/B3sAOH4bzJGZDrpgx1ci0S5oHYO1Y
 Awa3/A0FGmddDT1rNT9LtIhVJZFI0wBD2czq/6l+HBwQ6luliX5dYfaxf3fq/LQtn21J
 MPlHNu/lnzSCjkVL1ioIEvpA5fmtV+TfSvCpPsmC7aRnHzTHTDHqqwCxkLX/0Yjq0xVL
 fol6mVhTTlmppex/HfG+klO60NiIqgRmFF4XHIJMsCR0LYh0IT1O1WGqDsEhgIf3VThL
 +20hJSZXr3abFwJ/+e748dT+90ph4xYRMnYBC8pv6+hJE+c2/gBPusGZp8eAKMYoR1gk
 1Mhw==
X-Gm-Message-State: AOJu0YxePyTaASm4XcxPlMvQVpseXTODRCuD8o/XXTOeiUaoXdD4nRFi
 1LTttBZyXpW8HbEcoKkz1e8=
X-Google-Smtp-Source: AGHT+IE/gWTYeRXx8tnVq3xxFY5cMVtu8CcfVrP6BfYlMpgvl6xRQ6q/cxMFeSH0+1LZm+eEux/Qyg==
X-Received: by 2002:a54:4582:0:b0:3a7:1cca:f99f with SMTP id
 z2-20020a544582000000b003a71ccaf99fmr1263858oib.34.1691538684989; 
 Tue, 08 Aug 2023 16:51:24 -0700 (PDT)
Received: from ?IPV6:2601:204:df00:9cd0::c121? ([2601:204:df00:9cd0::c121])
 by smtp.gmail.com with ESMTPSA id
 ju22-20020a170903429600b001bb9b5e86b7sm9573153plb.91.2023.08.08.16.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 16:51:24 -0700 (PDT)
Message-ID: <93e3d058-96c3-4ff7-afd5-d6701cdc349b@gmail.com>
Date: Tue, 8 Aug 2023 16:51:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/amdkfd: Use memdup_user() rather than duplicating its
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>
References: <20230808205752.23704-1-rauji.raut@gmail.com>
 <8370cf91-66b5-d96b-fed8-a38eb488a011@amd.com>
From: Atul Raut <rauji.raut@gmail.com>
In-Reply-To: <8370cf91-66b5-d96b-fed8-a38eb488a011@amd.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org
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

SGVsbG8gRmVsaXgsCgpJIGFwcHJlY2lhdGUgdGhlIGNvZGUgcmV2aWV3LgpXaWxsIGNvcnJlY3Qg
dGhlwqAgdHlwbyAoc2VlbXMgdG8gaGF2ZSBhcHBlYXJlZCBkdXJpbmcgcGF0Y2ggY3JlYXRpb24g
CmZvbGxvd2luZyBjb21waWxhdGlvbikuClNob3J0bHkgYXMgdGhlIGNvbXBpbGF0aW9uIGlzIHN1
Y2Nlc3NmdWwsIFYyIHdpbGwgYmUgc2VudC4KCi1BdHVsCgpPbiA4LzgvMjMgMTU6NDcsIEZlbGl4
IEt1ZWhsaW5nIHdyb3RlOgo+IE9uIDIwMjMtMDgtMDggMTY6NTcsIEF0dWwgUmF1dCB3cm90ZToK
Pj4gVG8gcHJldmVudCBpdHMgcmVkdW5kYW50IGltcGxlbWVudGF0aW9uIGFuZCBzdHJlYW1saW5l
Cj4+IGNvZGUsIHVzZSBtZW1kdXBfdXNlci4KPj4KPj4gVGhpcyBmaXhlcyB3YXJuaW5ncyByZXBv
cnRlZCBieSBDb2NjaW5lbGxlOgo+PiAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jOjI4MTE6MTMtMjA6IAo+PiBXQVJOSU5HIG9wcG9ydHVuaXR5
IGZvciBtZW1kdXBfdXNlcgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBdHVsIFJhdXQgPHJhdWppLnJh
dXRAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA5ICsrKy0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKPj4g
aW5kZXggMmRmMTUzODI4ZmY0Li41MTc0MGUwMDdlODkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jCj4+IEBA
IC0yODA4LDEyICsyODA4LDkgQEAgc3RhdGljIHVpbnQzMl90ICpnZXRfcXVldWVfaWRzKHVpbnQz
Ml90IAo+PiBudW1fcXVldWVzLCB1aW50MzJfdCAqdXNyX3F1ZXVlX2lkX2FycmF5Cj4+IMKgwqDC
oMKgwqAgaWYgKCF1c3JfcXVldWVfaWRfYXJyYXkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gTlVMTDsKPj4gwqAgLcKgwqDCoCBxdWV1ZV9pZHMgPSBremFsbG9jKGFycmF5X3NpemUsIEdG
UF9LRVJORUwpOwo+PiAtwqDCoMKgIGlmICghcXVldWVfaWRzKQo+PiAtwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4+IC0KPj4gLcKgwqDCoCBpZiAoY29weV9mcm9tX3Vz
ZXIocXVldWVfaWRzLCB1c3JfcXVldWVfaWRfYXJyYXksIGFycmF5X3NpemUpKQo+PiAtwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVGQVVMVCk7Cj4+ICvCoMKgwqAgcXVldWVfaWRzID0g
bWVtZHVwX3VzZXIodXNyX3F1ZXVlX2lkX2FycmF5LCBhcnJheV9zaXplKTsKPj4gK8KgwqDCoCBp
ZiAoSVNfRVJSKElxdWV1ZV9pZHMpKQo+Cj4gWW91IGhhdmUgYSB0eXBvIGluIHRoZSB2YXJpYWJs
ZSBuYW1lIGhlcmUuIERpZCB5b3UgYXQgbGVhc3QgCj4gY29tcGlsZS10ZXN0IHRoZSBwYXRjaD8K
Pgo+Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihxdWV1ZV9pZHMpOwo+Cj4gSSB0
aGluayBpdCBzaG91bGQganVzdCByZXR1cm4gcXVldWVfaWRzIGhlcmUuIFRoYXQncyBhbHJlYWR5
IGFuIAo+IEVSUl9QVFIgaW4gY2FzZSBvZiBlcnJvcnMuIFNvIHlvdSBkb24ndCBldmVuIG5lZWQg
dGhlICJpZiIuIEp1c3QgdGhpcyAKPiBzaG91bGQgZG8gdGhlIGpvYjoKPgo+IMKgwqDCoCByZXR1
cm4gbWVtZHVwX3VzZXIodXNyX3F1ZXVlX2lkX2FycmF5LCBhcnJheV9zaXplKTsKPgo+IFRoZSBl
cnJvciBjaGVja2luZyBpcyBkb25lIGJ5IHRoZSBjYWxsZXIuCj4KPiBSZWdhcmRzLAo+IMKgIEZl
bGl4Cj4KPgo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBxdWV1ZV9pZHM7Cj4+IMKgIH0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1l
bnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgta2VybmVsLW1lbnRlZXMK
