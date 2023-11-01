Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F532C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 06:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF41042D0F;
	Wed,  1 Nov 2023 06:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF41042D0F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eqeUfVGk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GewW04m2HGiP; Wed,  1 Nov 2023 06:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EB0EB42CE7;
	Wed,  1 Nov 2023 06:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0EB42CE7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B786EC0039;
	Wed,  1 Nov 2023 06:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAFBDC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 06:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B0A81F85
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 06:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B0A81F85
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eqeUfVGk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFZdPC3z18LF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 06:42:20 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA6A481E42
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 06:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA6A481E42
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc0e78ec92so41695545ad.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698820939; x=1699425739;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=osCkAZShR5taCW6SV1HsSXC0KNTVnjVownZWdu919kU=;
 b=eqeUfVGk4cV2AupRIyuSux0ve2MkyqSj0lhn9ue7DaAuXKlf8bcIgp5jxjj9pz/TaN
 zJHv8v4XzuzCDIn9gqnf5lmHlJu51coPRFK0lblEjfNgpfONvJ4dsKTwhRvOY7frPIFS
 ttHlRmLhhGTNRnWSNsYlQXutsWWuhzhuKqtzHXnB1UiI901axt5xCt/y7pwcVmTmgIZe
 JZV8tt2q5vpR8QlYJAGUe2ur+9IYmq12LI0L6OAHNgRDkEzvfrtQdJe8voEqhZ0DejuH
 zqPN+zoLcACjWS65xGP3EyeYDVr285tg3Yd9qlCJ93Sjl11aQfQ/ZkmW+mUZFP9IrPyK
 8rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698820939; x=1699425739;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=osCkAZShR5taCW6SV1HsSXC0KNTVnjVownZWdu919kU=;
 b=vL6RjWzvSv+tPFM3wsevzX0WIXRhQ/d4VHyjr6NuiFbP9WFPXQcCx03KP/eOnUnouK
 XDilwk45wFBUGgZCfep4tEzsxrf6xuj3rCAALHbToHuZdyW5Mbx4kKGZuVJWgSnMQBy/
 iWkzOFSpEGmPLyzp20C6fb+NJL7+Dp5jqg8vamt5+QsNAXrhwpXpfzIO3h3r2LPW1A26
 fn5o3zKUJgGAEwiQ/DG/gqvA5ZurPNbDZ2QODIrX9J4915te8i1L/RbCxl6WDa3t3LjH
 sHswgYk5vMhrJVxDWmFu01MmSxGDDu20jswwF+SHH0IOuImHtQARf+5tShP9ldJBs/KJ
 zMVg==
X-Gm-Message-State: AOJu0Yw05sCOjRpZjgQElOa6Eo7Ov7XGtQs4UKcutpa9Cad3VPuRF2e0
 pt+CtW09mqOWheF9uZRK+i4=
X-Google-Smtp-Source: AGHT+IE/xBdJG3FdMjRMwmd2VFlP290FD035x4hYgrrl8p8Rnijmg1W6YwuFF+MOaVxffZq50NAlGw==
X-Received: by 2002:a17:902:cf46:b0:1cc:6cc3:d9ba with SMTP id
 e6-20020a170902cf4600b001cc6cc3d9bamr2807830plg.4.1698820938942; 
 Tue, 31 Oct 2023 23:42:18 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.177]) by smtp.gmail.com with ESMTPSA id
 e19-20020a170902f1d300b001b898595be7sm624620plc.291.2023.10.31.23.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 23:42:18 -0700 (PDT)
Message-ID: <a63a6936-8422-47d5-9fc5-5c40a9915665@gmail.com>
Date: Wed, 1 Nov 2023 12:12:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: fix shift-out-of-bounds in dbJoin
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dave.kleikamp@oracle.com, shaggy@kernel.org
References: <20231011143937.31996-1-ghandatmanas@gmail.com>
 <50a32ba6-0051-6b70-aa8a-f565f8119a69@gmail.com>
Content-Language: en-US
In-Reply-To: <50a32ba6-0051-6b70-aa8a-f565f8119a69@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+411debe54d318eaed386@syzkaller.appspotmail.com
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

SGksIGNhbiB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHBhdGNoCgpPbiAxNi8xMC8yMyAyMDozMCwg
TWFuYXMgR2hhbmRhdCB3cm90ZToKPiBKdXN0IGEgZnJpZW5kbHkgcGluZyA6KQo+Cj4gT24gMTEv
MTAvMjMgMjA6MDksIE1hbmFzIEdoYW5kYXQgd3JvdGU6Cj4+IEN1cnJlbnRseSB3aGlsZSBqb2lu
aW5nIHRoZSBsZWFmIGluIGEgYnVkZHkgc3lzdGVtIHRoZXJlIGlzIHNoaWZ0IG91dAo+PiBvZiBi
b3VuZCBlcnJvciBpbiBjYWxjdWxhdGlvbiBvZiBCVURTSVpFLiBBZGRlZCB0aGUgcmVxdWlyZWQg
Y2hlY2sKPj4gdG8gdGhlIEJVRFNJWkUgYW5kIGZpeGVkIHRoZSBkb2N1bWVudGF0aW9uIGFzIHdl
bGwuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNDExZGViZTU0ZDMxOGVhZWQzODZAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQo+PiBDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL2J1Zz9leHRpZD00MTFkZWJlNTRkMzE4ZWFlZDM4Ngo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5h
cyBHaGFuZGF0IDxnaGFuZGF0bWFuYXNAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgZnMvamZzL2pm
c19kbWFwLmMgfCA4ICsrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2pmcy9qZnNfZG1hcC5jIGIv
ZnMvamZzL2pmc19kbWFwLmMKPj4gaW5kZXggNmI4MzhkM2FlN2MyLi5iYWE5N2JkYTFjN2EgMTAw
NjQ0Cj4+IC0tLSBhL2ZzL2pmcy9qZnNfZG1hcC5jCj4+ICsrKyBiL2ZzL2pmcy9qZnNfZG1hcC5j
Cj4+IEBAIC0yNzMwLDcgKzI3MzAsOSBAQCBzdGF0aWMgaW50IGRiQmFja1NwbGl0KGRtdHJlZV90
ICogdHAsIGludCBsZWFmbm8pCj4+IMKgwqAgKsKgwqDCoCBsZWFmbm/CoMKgwqAgLSB0aGUgbnVt
YmVyIG9mIHRoZSBsZWFmIHRvIGJlIHVwZGF0ZWQuCj4+IMKgwqAgKsKgwqDCoCBuZXd2YWzCoMKg
wqAgLSB0aGUgbmV3IHZhbHVlIGZvciB0aGUgbGVhZi4KPj4gwqDCoCAqCj4+IC0gKiBSRVRVUk4g
VkFMVUVTOiBub25lCj4+ICsgKiBSRVRVUk4gVkFMVUVTOgo+PiArICrCoCAwwqDCoMKgwqDCoMKg
wqAgLSBzdWNjZXNzCj4+ICsgKsKgwqDCoCAtRUlPwqDCoMKgIC0gaS9vIGVycm9yCj4+IMKgwqAg
Ki8KPj4gwqAgc3RhdGljIGludCBkYkpvaW4oZG10cmVlX3QgKiB0cCwgaW50IGxlYWZubywgaW50
IG5ld3ZhbCkKPj4gwqAgewo+PiBAQCAtMjc1Nyw2ICsyNzU5LDEwIEBAIHN0YXRpYyBpbnQgZGJK
b2luKGRtdHJlZV90ICogdHAsIGludCBsZWFmbm8sIAo+PiBpbnQgbmV3dmFsKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIGdldCB0aGUgYnVkZHkgc2l6ZSAobnVtYmVyIG9mIHdvcmRzIGNvdmVy
ZWQpIG9mCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhlIG5ldyB2YWx1ZS4KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8KPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKChuZXd2YWwgLSB0
cC0+ZG10X2J1ZG1pbikgPiBCVURNSU4pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlPOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBidWRzeiA9IEJVRFNJWkUobmV3dmFs
LCB0cC0+ZG10X2J1ZG1pbik7Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB0cnkgdG8gam9p
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
a2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
