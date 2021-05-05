Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268E6C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 03:32:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872376138C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 03:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872376138C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2440F4061E;
	Wed,  5 May 2021 03:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOi-qnQ_D6q1; Wed,  5 May 2021 03:32:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09AAF40619;
	Wed,  5 May 2021 03:32:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFBEEC000D;
	Wed,  5 May 2021 03:32:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B17CFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 03:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9745860C1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 03:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVXXr7kqy8vB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 03:32:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98E7760805
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 03:32:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j10so525216lfb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 May 2021 20:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=cPqc+tLmPzS0kiHbhsHAeztSAIaMxJaZ9walt38dA9I=;
 b=JaMbBRtTURCOso2Pl7S7iIovHeyduRpzsCHovTw8gV0NDWR57Rtd0RKnBy8X/9+7r/
 AhB5Q7wDzpi1MvZ0R/6WHsS70vmd+/TQS2RwqvfseyMDw0K/XJw9s3aGKvelksOphGAh
 SOJNC9f1BC/ckAQlEbyV+Io35AqEcb9iyOUhFHcyoxRVpWRIjh2m9EWE9OsnHll2L2ix
 YbSWkKFYY1VcXp5BAc7wAiwQs3aVqczdSkw7RILzXyZ5nrnLnahGKiEpJHcK71kmN5WW
 w3sqfIaeNUWT2ZERwSKGu3jDQBKW2LdL6kPua79oyX0zc2/es2HjOOStFsOZYbhyPOAt
 15iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=cPqc+tLmPzS0kiHbhsHAeztSAIaMxJaZ9walt38dA9I=;
 b=eIRwo9R3epzulqTUnk9pXTePSYekcs4iW5xgKtWVyb41wQdGMeFeEWWN7rGlhvT0Co
 3q+hA0FLc52wx0L08/9Ex/maIf28i71vmtNFw8cDCChU4sVflTy/8nW0ECFeNT2kgrhI
 dThSvfWl5AdEIlyHSHl9C9757DKPCoYCxJSAEJIuUzCLXgXmCTuUOc4pk3ExBoPsXc6U
 Qa8aAiGk7u6TjRC+KgZfgg1Zmm9gZOGPmgnEmWd7dC4GhF6i5jsE+AHHfWqqbXkO6VRr
 SFZFLIevdlmqpyFNmHm3ewjqihsWRQphBLP5BhGCsnFhhMyquz+tILP1h6diqtXD9DSO
 S5UQ==
X-Gm-Message-State: AOAM5327YDffmpg7RuIrXqiA8bOxmMArLMwf018QxHPxj5Hflzgg0wNu
 nIVS7b6UZz0fyDn9AAWwp5Zff/EwijZZTAvJ8z4=
X-Google-Smtp-Source: ABdhPJwF3HEdgx7Dvarp99TorU+WH874ZQYNfSFNAQZur2OOJyty4jzIKXfWB7Mnhlr6EmtfSorz8n096ElIjyl1RUc=
X-Received: by 2002:a05:6512:3a8b:: with SMTP id
 q11mr18839902lfu.513.1620185564346; 
 Tue, 04 May 2021 20:32:44 -0700 (PDT)
MIME-Version: 1.0
From: Shubham <shubhunic@gmail.com>
Date: Wed, 5 May 2021 09:02:33 +0530
Message-ID: <CAD=kLpvTpUrdFS9QXWChQ6JBmNzB1PQQaeYyARhZaRC35E8x3g@mail.gmail.com>
Subject: Regarding Linux Kernel: Checkpatch Documentation
To: dwaipayanray1@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

SGVsbG8gRGVhciBEd2FpcGF5YW4sCgpJIGFtIFNodWJoYW0gVmVybWEsIGEgQi5UZWNoIGZpbmFs
IHllYXIsIEluZm9ybWF0aW9uIFRlY2hub2xvZ3kgdW5kZXJncmFkdWF0ZQpzdHVkZW50IGF0IEVu
Z2luZWVyaW5nIENvbGxlZ2UgQmlrYW5lci4gSSB3b3VsZCBsaWtlIHRvIGxvb2sgaW50byB3b3Jr
aW5nIHdpdGgKTEZYIE1lbnRvcnNoaXAgUHJvZ3JhbS4gSSB3YW50IHRvIHdvcmsgb24gdGhlICJM
aW51eCBLZXJuZWw6IENoZWNrcGF0Y2gKRG9jdW1lbnRhdGlvbiIgcHJvamVjdC4KCkkgaGF2ZSBh
IGdvb2QgdW5kZXJzdGFuZGluZyBvZiBzb2Z0d2FyZSBlbmdpbmVlcmluZy1yZWxhdGVkIG1ldGhv
ZG9sb2dpZXMsCnRvb2xzLCBhbmQgdXNhZ2VzLiBhbmQgSSBhbHNvIGNvbnRyaWJ1dGVkIHRvIGdp
dCBvcmdhbml6YXRpb24gYW5kIGhhdmUgYSBnb29kCnVuZGVyc3RhbmRpbmcgb2YgR2l0IHZlcnNp
b24gY29udHJvbCBhbmQgd3JpdGluZyB0ZXN0cy4gRnJvbSBwcmV2aW91cyBwZXJzb25hbApleHBl
cmltZW50cywgY29sbGVnZSBwcm9qZWN0cywgYW5kIGludGVybnNoaXBzLCBJIGdhaW4gZXhwZXJp
ZW5jZSBpbiB3cml0aW5nCnRlY2huaWNhbCByZXBvcnRzLCBkb2N1bWVudGF0aW9uIChmdW5jdGlv
bnMsIGNsYXNzZXMsIHVzZSBjYXNlcywg4oCmKQpmb3IgcHJvamVjdHMsCmV0Yy4gYW5kIEkgaGF2
ZSBzdWJzdGFudGlhbCBleHBlcmllbmNlIGluIHdvcmtpbmcgd2l0aCBDL0MrKywgUHl0aG9uLCBP
YmplY3QKLU9yaWVudGVkIFByb2dyYW1taW5nLCBEYXRhIFN0cnVjdHVyZSBhbmQgY2FuIGVhc2ls
eSBpbXBsZW1lbnQgYWxnb3JpdGhtcy4KClBsZWFzZSBnaXZlIG1lIHNvbWUgaWRlYSBhYm91dCBo
b3cgSSBjYW4gc3RhcnQgd29ya2luZyBvbiB0aGlzIHByb2plY3Q/Ckkgd2FudGVkIHRvIGtub3cg
d2hhdCBvdGhlciB0aGluZ3MgSSBoYXZlIHRvIGRvIHRvIGJlIHBhcnQgb2YgYW4gb3JnYW5pemF0
aW9uLgoKSSByZWNlbnRseSBjb250cmlidXRlZCB0byB0aGUgR2l0IG9yZ2FuaXphdGlvbiBhbmQg
cGxlYXNlIGxvb2sgYXQgbXkgd29yay4KaHR0cHM6Ly9naXRodWIuY29tL2dpdC9naXQvY29tbWl0
L2ZiYWQzNTA1ZWVlMmY1OGVjMDEwYjAxYmRkMDA1ZmY0ZDM2YjVjMDEKaHR0cHM6Ly9naXRodWIu
Y29tL2dpdC9naXQvY29tbWl0LzQ0ZTAzYmZkYjY5NGQxN2I4MzI5NjU0MDAwNjE5NDhlZjhmMjA5
ZTcKCkkgd291bGQgYmUgZ3JhdGVmdWwgaWYgeW91IGNhbiB0ZWxsIG1lIGlmIHRoZXJlJ3MgYW55
dGhpbmcgZWxzZSB0aGF0IEkKY291bGQgZG8gd2hpY2gKd291bGQgYmUgYXBwcmVjaWF0ZWQuIEFu
eSBmdXJ0aGVyIGd1aWRhbmNlIG9yIGlucHV0cyB3b3VsZCBjZXJ0YWlubHkKYmUgb2YgZ3JlYXQg
aGVscC4KClRoYW5rIFlvdSEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
