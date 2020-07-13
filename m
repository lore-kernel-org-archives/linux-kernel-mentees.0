Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E12C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:24:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D22206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTmeCPcn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D22206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A4071231F2;
	Mon, 13 Jul 2020 17:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-bH+-jLiBKA; Mon, 13 Jul 2020 17:24:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CDD5120469;
	Mon, 13 Jul 2020 17:24:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF1CFC0888;
	Mon, 13 Jul 2020 17:24:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 094BEC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05B3B893A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkgV-ercGR-G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47D58893A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:24:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id bm28so12394200edb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e0LSuR+yshIoYGz+eEEY3hbB8A+14sBty8Ug4yMkgfM=;
 b=nTmeCPcn+ozK+Ag5RxEELeJLLx9ti8jrlnkSeGn+v7o9o0VF9oqTW9mzAjEAFJQnWc
 qy5WrcnWfHjIf32n1rZMIh7sjY+87PmkNyonBFjkMmm/slYoFKySiIDO6+eFTW7DyjhV
 dcAIkLxDSgKq8n2k3M6w/g/AfcEEasZ0+ubo5y3FP86jcAmIC3Bp4bSbEpCr+H2fGieA
 cWR5TAwnj5PuzxwIQ+aw+2sXxWXcbl3OLOr7p1EQo/nTFJ+CtkPPFFCWRh9nn7Mgar9C
 QL2BtaG9MVgA1PHr+APD1CbIGDru+t9rECcfdiYNqx3sePEn6oCyMM3NaVw/Kh7k8nKA
 G6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e0LSuR+yshIoYGz+eEEY3hbB8A+14sBty8Ug4yMkgfM=;
 b=ZmNhKm+xE8GzTX+Z5eUObm9kyW95W2MVBzwXPjRncoijbsLhB9Qd0gXaO6CclBQh8W
 FAb8GdIE6+/yuuDydJV/zyUsgF88YXjcq2DyZHqZdkeDXbVIkIWf63OtOpDE0rh5R2aW
 a3hNS+0rQAYOXADyOdId324TCmwV2banMOCDtadc+gCD+lLLrC4GR5zcHQKfXtuECQbO
 9u2ADUAlr3nzAT9eLzi7v3n2EBpLgPCfhOYtWJR8M3pFtUOgEZFBewZ9OnuNfCLYwFpM
 MTsCeT6FuSEGsi4DBfAlJbcPXaQk5tFuYq4IHquLuIfdJzcCBVtkeq1Bo1trWrKwCVJz
 7tcg==
X-Gm-Message-State: AOAM533tn/EZw4MzwRG7hpEebtRPszEE4qyfkCSRiEIanFrbFZsRDzvZ
 6PTIsdMkMyKJhHfSFjcWt1Ij0R46R/2rDQ==
X-Google-Smtp-Source: ABdhPJwU6CC1g8gnvm6vkaI0vzF7ML92p+FtcVVEx2//52B6Q3pLKNShFOHB6NyG1tBi9qTBjIHGwg==
X-Received: by 2002:a05:6402:c82:: with SMTP id
 cm2mr441209edb.293.1594661046520; 
 Mon, 13 Jul 2020 10:24:06 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id t25sm10192694ejc.34.2020.07.13.10.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 10:24:05 -0700 (PDT)
To: "Rajashekar, Revanth" <revanth.rajashekar@intel.com>, helgaas@kernel.org, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-10-refactormyself@gmail.com>
 <0762f646-90a1-217c-4e4b-6168d85bb08a@intel.com>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <f48dece5-7483-73ac-38bb-0dce323f404c@gmail.com>
Date: Mon, 13 Jul 2020 20:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0762f646-90a1-217c-4e4b-6168d85bb08a@intel.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 09/35] nvme-pci: Change
	PCIBIOS_SUCCESSFUL to 0
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

Ck9uIDcvMTMvMjAgNjo0MiBQTSwgUmFqYXNoZWthciwgUmV2YW50aCB3cm90ZToKPiBIaSwKPgo+
IE9uIDcvMTMvMjAyMCA2OjIyIEFNLCBTYWhlZWQgTy4gQm9sYXJpbndhIHdyb3RlOgo+PiBJbiBy
ZWZlcmVuY2UgdG8gdGhlIFBDSSBzcGVjIChDaGFwdGVyIDIpLCBQQ0lCSU9TKiBpcyBhbiB4ODYg
Y29uY2VwdC4KPj4gVGhlaXIgc2NvcGUgc2hvdWxkIGJlIGxpbWl0ZWQgd2l0aGluIGFyY2gveDg2
Lgo+Pgo+PiBDaGFuZ2UgYWxsIFBDSUJJT1NfU1VDQ0VTU0ZVTCB0byAwCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6ICJTYWhlZWQgTy4gQm9sYXJpbndhIiA8cmVmYWN0b3JteXNlbGZAZ21haWwuY29tPgo+
PiAtLS0KPj4gICBkcml2ZXJzL252bWUvaG9zdC9wY2kuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbnZtZS9ob3N0L3BjaS5jIGIvZHJpdmVycy9udm1lL2hvc3QvcGNpLmMKPj4gaW5kZXgg
YjFkMThmMDYzM2M3Li5kNDI2ZWZiNTNmNDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbnZtZS9o
b3N0L3BjaS5jCj4+ICsrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L3BjaS5jCj4+IEBAIC0xMTg1LDcg
KzExODUsNyBAQCBzdGF0aWMgdm9pZCBudm1lX3dhcm5fcmVzZXQoc3RydWN0IG52bWVfZGV2ICpk
ZXYsIHUzMiBjc3RzKQo+PiAgIAo+PiAgIAlyZXN1bHQgPSBwY2lfcmVhZF9jb25maWdfd29yZCh0
b19wY2lfZGV2KGRldi0+ZGV2KSwgUENJX1NUQVRVUywKPj4gICAJCQkJICAgICAgJnBjaV9zdGF0
dXMpOwo+PiAtCWlmIChyZXN1bHQgPT0gUENJQklPU19TVUNDRVNTRlVMKQo+PiArCWlmIChyZXN1
bHQgPT0gMCkKPiBIb3cgYWJvdXQgc2ltcGxpZnlpbmcgdGhlIGNoZWNrIHRvIGlmICghcmVzdWx0
KT8KClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy7CoCBJIGRpZCBpbiBQQVRDSCAxMC8zNS4gSSB3
aWxsIG1lcmdlIGJvdGguCgpJIHdhbnRlZCB0byBzZXBhcmF0ZSB0aGUgZ29hbCBmcm9tIHRoZSBm
aXggYnV0IEkgc2VlIGl0J3MgY29uZnVzaW5nLgoKLSBTYWhlZWQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxp
bmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtl
cm5lbC1tZW50ZWVzCg==
