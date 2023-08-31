Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1737C83F2E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 31 Aug 2023 15:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5034281DE3;
	Thu, 31 Aug 2023 15:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5034281DE3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=H+bsnouU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCsjvyZYn-3m; Thu, 31 Aug 2023 15:19:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E8E4181C26;
	Thu, 31 Aug 2023 15:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E4181C26
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFE1FC0039;
	Thu, 31 Aug 2023 15:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7FFDC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Aug 2023 15:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E21560C28
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Aug 2023 15:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E21560C28
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=H+bsnouU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmUQX9JyWv77
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Aug 2023 15:19:15 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6611E60B15
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Aug 2023 15:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6611E60B15
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso6691655ad.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 31 Aug 2023 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693495155; x=1694099955;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T/oC9BzvxaceMGHbIWoQh4iOvX8/1tUpbJQYA6I/O+Y=;
 b=H+bsnouUcZ1oCj8xcwA47NV5Gl8NjgifKjRnSVt1pM1E6/ZD699l/yOjisL6JvP7MJ
 fSOGQT7lBDD8uB2xTTVjNleox2ayEr5gTOSWgnCIcdoeBVMaDwDhVKv+qFhLEPi5dwsY
 yxxBWOT37Oxf8JJ2+YecsGXTogvN3lM1JBOtmRyiP9wpBoeHXGtr07c4DUZL8rnMpF01
 Id0jogFpTFSpuHQ5xHR7wLvsVwPTWZh5OV4zDusGBanseGMvTQG1sfAG4M4+GeQg053/
 DjPRWYv9JfdfJRfvn7sL3RZAQUodiC37IC741HzMJdxffA/ZDTnnm4xiJ3iEoriloBXc
 kfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693495155; x=1694099955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T/oC9BzvxaceMGHbIWoQh4iOvX8/1tUpbJQYA6I/O+Y=;
 b=dU3rzsPJgzeegKHAfVm2pAW0sqZYFs/SRHDzwYCQeZjfoI3BNpjLMc9GMV6neeZ17J
 J75H5dgYQnqmZ2+7hNV8YRQxDiloAVqirt+DF7FVeALMOT3wHQBKQevpZvsaAlJoWX3o
 tp25ELOBKDwftvotg602sJ7eWBdrqtXQ5jQ1PIeQhe9KkshVsGvp5pb5T+nHtLtTk7c7
 b+PaUzwXYxpi6QPKZINW8B9lJhA6HCs/IPgjMNFwms3SpQ44x9a0Hl6yF8tKyR5D/Ydo
 1j7YndtYGcGdoQIM1PulP0Sd0B0wGe6/U3JdcCtm6p50ewgb7BjygjieQv90e/tIiYN+
 VCVw==
X-Gm-Message-State: AOJu0YzWjWkIzUepIkgJ1dFkxEvOQZVMumnYzCAmLkRKXx3hts/gJBJg
 vSx+Ua0G9EWM584weuvmYhM=
X-Google-Smtp-Source: AGHT+IGIS7G4ToDoe5lC2A/vLDNcKjVwvaUH594eytpS3UknzaXcdyY+egAjDfEufcTx0oRO6EbQFw==
X-Received: by 2002:a17:902:e744:b0:1bb:b226:52a0 with SMTP id
 p4-20020a170902e74400b001bbb22652a0mr13952plf.44.1693495154610; 
 Thu, 31 Aug 2023 08:19:14 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.174]) by smtp.gmail.com with ESMTPSA id
 ja20-20020a170902efd400b001bdc6ca748esm1386625plb.185.2023.08.31.08.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 08:19:14 -0700 (PDT)
Message-ID: <ae6ce935-96eb-3d40-f252-54fff7eb0ea9@gmail.com>
Date: Thu, 31 Aug 2023 20:49:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in dbFindLeaf
Content-Language: en-US
To: Dave Kleikamp <dave.kleikamp@oracle.com>, shaggy@kernel.org,
 liushixin2@huawei.com
References: <20230829165244.460154-1-ghandatmanas@gmail.com>
 <e62dbf53-9d74-45e5-b44e-53140672b8b5@oracle.com>
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <e62dbf53-9d74-45e5-b44e-53140672b8b5@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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

SSB3YXMgd29uZGVyaW5nIGlmIHdlIGNvdWxkIGltcGxlbWVudCBhIGdldF90cmVlX3NpemUgbWFj
cm8gd2hlcmVpbsKgIHdlIApjb3VsZCBmaW5kIHRoZSB0cmVlIHNpemUgc28gdGhhdCB3ZSBjYW4g
ZG8gdGhlIGNvbXBhcmlzb24uIFNJbmNlIHRoZSAKdHAtPmRtdF9zdHJlZSBpcyBhbiBhcnJheSB3
ZSBjYW4gZ2V0IGl0cyBzaXplIGFuZCBmaXggdGhlIG91dCBvZiBib3VuZHMuIApXb3VsZCB0aGlz
IHRoaW5nIHdvcms/CgpPbiAzMC8wOC8yMyAwMDowOCwgRGF2ZSBLbGVpa2FtcCB3cm90ZToKPiBU
aGlzIHdvbid0IHdvcmsuIGRiRmluZExlYWYoKSBjYW4gYmUgY2FsbGVkIGZyb20gZGJGaW5kQ3Rs
KCkgd2l0aCAKPiBzdHJ1Y3QgZG1hcGN0bCB3aG9zZSBzdHJlZSBpbmRleCBjYW4gYmUgYXMgaGln
aCBhcyBDVExUUkVFU0laRSB3aGljaCAKPiBpcyBsYXJnZXIgdGhhbiBUUkVFU0laRS4gQSBjaGVj
ayBhZ2FpbnN0IENUTFRSRUVTSVpFIG1pZ2h0IGJlIGJldHRlciAKPiB0aGFuIG5vdGhpbmcgYXQg
YWxsIGJ1dCB3b24ndCBuZWNlc3NhcmlseSBkZXRlY3QgYW4gb3ZlcmZsb3cuIAo+IEN1cnJlbnRs
eSwgZGJGaW5kTGVhZiBkb2Vzbid0IGhhdmUgYW55dGhpbmcgdG8gdGVsbCBpdCB3aGljaCB0cmVl
IGl0IAo+IGlzIHdvcmtpbmcgb24uCj4KPiBXZSBjb3VsZCBwYXNzIGluIHRoZSB0cmVlc2l6ZSBh
cyBhbiBhcmd1bWVudCB0byBkYkZpbmRDdGwoKSBpZiB3ZSAKPiBjYW4ndCBjb21lIHVwIHdpdGgg
c29tZXRoaW5nIHNpbXBsZXIuCj4KPiBTaGFnZ3kKPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5h
cyBHaGFuZGF0IDxnaGFuZGF0bWFuYXNAZ21haWwuY29tPgo+PiBSZXBvcnRlZC1ieTogc3l6Ym90
K2FlYTFhZDkxZTg1NGQwYTgzZTA0QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPj4gQ2xvc2Vz
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9YWVhMWFkOTFlODU0ZDBh
ODNlMDQKPj4gLS0tCj4+IMKgIGZzL2pmcy9qZnNfZG1hcC5jIHwgNCArKysrCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2pmcy9qZnNf
ZG1hcC5jIGIvZnMvamZzL2pmc19kbWFwLmMKPj4gaW5kZXggYTE0YTBmMThhNGM0Li41YWYxN2Iy
Mjg3YmUgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2pmcy9qZnNfZG1hcC5jCj4+ICsrKyBiL2ZzL2pmcy9q
ZnNfZG1hcC5jCj4+IEBAIC0yOTQ4LDYgKzI5NDgsMTAgQEAgc3RhdGljIGludCBkYkZpbmRMZWFm
KGRtdHJlZV90ICogdHAsIGludCBsMm5iLCAKPj4gaW50ICpsZWFmaWR4KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBzdWZmaWNpZW50IGZyZWUgc3BhY2UgZm91bmQuwqAgbW92ZSB0
byB0aGUgbmV4dAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbGV2ZWwgKG9yIHF1
aXQgaWYgdGhpcyBpcyB0aGUgbGFzdCBsZXZlbCkuCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKi8KPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoeCArIG4gPiBUUkVF
U0laRSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1NQQzsK
Pj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobDJuYiA8PSB0cC0+ZG10X3N0
cmVlW3ggKyBuXSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
