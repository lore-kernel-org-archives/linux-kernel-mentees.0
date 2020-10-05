Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9D4C47095
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 20:07:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9468F21481
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 20:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmWP4LhW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9468F21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E17DD204FF;
	Mon,  5 Oct 2020 20:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEHrHH+6rFJH; Mon,  5 Oct 2020 20:07:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87EF62042C;
	Mon,  5 Oct 2020 20:07:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72468C07FF;
	Mon,  5 Oct 2020 20:07:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C950BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AE694204E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tWrZ6CGTL7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 20:07:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 7AF792042C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 20:07:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m13so9908448otl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HngBJsT2pkNDfP0iYFdvrmf5+8JD+RQ4uR+8/uEH3kU=;
 b=WmWP4LhW5Mtpt3xsgUH8bdwh5aBSFjcbvn/f1V/IRA63gJV/VHv/+fOcvQX7FPNN99
 neZEQfbVWBPvrqP+ktgwqz0GFZXyOFoDqqFOrPZc19kZqVCx5KDDPE5c5BnL/N9jJAQi
 HC5p1KY5XNx/YtvnIk8a19t5pYAoXGXJ7/oTV0wLXZZJd8xaoKa6spDxYJtHDW9IniDz
 fKWuE369yd3jQki9stEpJHnJxJMrjHWzfjdTAqhOorjMWdinMGHesiUNi8dkZLtCjyr7
 Xv/g5dxKRt3k68uKQjgh1BYzotJZ0ATWDVU0NgR4d0jc9MbphxiisILORcEYgzRF0q0b
 CIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HngBJsT2pkNDfP0iYFdvrmf5+8JD+RQ4uR+8/uEH3kU=;
 b=Iy6SdhqJ/PeQ77EUzXfwLKzgywllaEBTb0u4tghH0F/ZbejcplLEG0v8RHLYeG/UFz
 Abr1JRU5/Dcmfa2V7T3fMW3jBCfRgjQ2F+RWb7nri8NQuLPemM6uN9E9eROEj7jt9o1R
 0i4Yc6DbO1m001K9BVndW5qG0+xd9+JzaZDSTIbeX79rfO4mZ73iEmGHGMtSCLy4zvoG
 o0xo2M0tFKpO2JW5WJjj7UU4b3w0nPLQ24qIW+dS4eTvAWkoCE8RglLLPF63mJssJSfz
 mBCl55mpGktnAPDMKeHzrZEH7JApRHbSTxN4ss8I8DGOTZ2hplAEicLjC2iY3ARdIr6a
 ksbQ==
X-Gm-Message-State: AOAM532A1ooOp2nv/uUeUIOkat+AunBFxu953KywXL9qTt17dUtNh3fq
 O4lVB7Awvdq+ZcVGDOCewwOcJhZZJLvVl4HiUOc=
X-Google-Smtp-Source: ABdhPJxf2RXS+Rz/Sgu1KGCSn4ecBqvlxczn7/w8RO8ORfWBSRAkGO7vfdi4Yg/UmXv85ycO0PkS3Fbh7XWhDbOXWTY=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr652029oth.215.1601928464464; 
 Mon, 05 Oct 2020 13:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201005192409.192317-1-dwaipayanray1@gmail.com>
 <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
In-Reply-To: <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 6 Oct 2020 01:37:22 +0530
Message-ID: <CABJPP5DDmurU9c2qCoJcg7hvwnkYo4LCx+TW6xKG2G23Uf_Cxw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new warnings
	to author signoff checks.
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

T24gVHVlLCBPY3QgNiwgMjAyMCBhdCAxOjA3IEFNIEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5j
b20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyMDIwLTEwLTA2IGF0IDAwOjU0ICswNTMwLCBEd2FpcGF5
YW4gUmF5IHdyb3RlOgo+ID4gVGhlIGF1dGhvciBzaWduZWQtb2ZmLWJ5IGNoZWNrcyBhcmUgY3Vy
cmVudGx5IHZlcnkgdmFndWUuCj4gPiBDYXNlcyBsaWtlIHNhbWUgbmFtZSBvciBzYW1lIGFkZHJl
c3MgYXJlIG5vdCBoYW5kbGVkIHNlcGFyYXRlbHkuCj4KPiBXaGVuIHlvdSBydW4gdGVzdHMgZm9y
IHRoaXMsIGhvdyBtYW55IG1pc21hdGNoZXMgYXJlCj4gY2F1c2VkIGJ5IG5hbWUgZm9ybWF0dGlu
ZyBjaGFuZ2VzIGxpa2U6Cj4KPiBGcm9tOiAiRGV2ZWxvcGVyLCBKLiBSYW5kb20iIDxqcmRAYmln
Y29ycC5jb20+Cj4gLi4uCj4gU2lnbmVkLW9mZi1ieTogIkouIFJhbmRvbSBEZXZlbG9wZXIiIDxq
cmRAYmlnY29ycC5jb20+Pwo+Cj4gU2hvdWxkIHRoZXNlIGRpZmZlcmVuY2VzIGdlbmVyYXRlIGEg
d2FybmluZz8KPgoKSGksCkkgcmFuIG15IHRlc3RzIG9uIG5vbiBtZXJnZSBjb21taXRzIGJldHdl
ZW4gdjUuNyBhbmQgdjUuOC4KClRoZXJlIHdlcmUgYSB0b3RhbCBvZiAyNTAgTk9fQVVUSE9SX1NJ
R05fT0ZGIFdhcm5pbmdzCgoyMDMgb2YgdGhlc2Ugd2VyZSBlbWFpbCBhZGRyZXNzIG1pc21hdGNo
ZXMuCjMyIG9mIHRoZXNlIHdlcmUgbmFtZSBtaXNtYXRjaGVzLgoKU28gZm9yIHRoZSBuYW1lIG1p
c21hdGNoZXMsIHRoZSB0eXBpY2FsIGNhc2VzIGFyZSBsaWtlOgoKJ0Zyb206IHRhbm5lcmxvdmUg
PHRhbm5lcmxvdmVAZ29vZ2xlLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiBUYW5uZXIKTG92ZSA8
dGFubmVybG92ZUBnb29nbGUuY29tPicKJ0Zyb206ICLmnLHngb/ngb8iIDx6aHVjYW5jYW5Adml2
by5jb20+JyAhPSAnU2lnbmVkLW9mZi1ieTogemh1Y2FuY2FuCjx6aHVjYW5jYW5Adml2by5jb20+
JwonRnJvbTogWXV2YWwgQmFzc29uIDx5YmFzb25AbWFydmVsbC5jb20+JyAhPSAnU2lnbmVkLW9m
Zi1ieTogWXV2YWwKQmFzb24gPHliYXNvbkBtYXJ2ZWxsLmNvbT4nCidGcm9tOiBhbGxlbiA8YWxs
ZW4uY2hlbkBpdGUuY29tLnR3PicgIT0gJ1NpZ25lZC1vZmYtYnk6IEFsbGVuIENoZW4KPGFsbGVu
LmNoZW5AaXRlLmNvbS50dz4nCgpJIGRpZG4ndCBmaW5kIHRoZSBleGFjdCBmb3JtYXR0aW5nIGNo
YW5nZSB5b3UgbWVudGlvbmVkIGluIG15IGNvbW1pdCByYW5nZS4KQnV0IEkgZGlkIGZpbmQgc29t
ZXRoaW5nIGxpa2U6CgonRnJvbTogIlBhdWwgQS4gQ2xhcmtlIiA8cGNAdXMuaWJtLmNvbT4nICE9
ICdTaWduZWQtb2ZmLWJ5OiBQYXVsCkNsYXJrZSA8cGNAdXMuaWJtLmNvbT4nCgpTbyBpdCdzIGxp
a2Ugc29tZSBoYXZlIHBhcnRzIG9mIHRoZWlyIG5hbWVzIHJlbW92ZWQsIHNvbWUgaGF2ZSBsYW5n
dWFnZQpjb25mbGljdHMsIGFuZCB5ZXQgc29tZSBoYXZlIHdlbGwgZGlmZmVyZW50IHNwZWxsaW5n
cywgb3IgaW5pdGlhbHMsCmV0Yy4gSXQncyBsaWtlCmEgd2lkZSB2YXJpZXR5IG9mIHRoaW5ncyBo
YXBwZW5pbmcgaGVyZS4KCkkgdGhpbmsgY29uc2lkZXJpbmcgdGhlc2UsIGl0IHNob3VsZCBiZSB3
YXJuZWQgYWJvdXQsIGFuZCBsZXQgcGVvcGxlIGtub3cKdGhhdCB0aGVyZSBtaWdodCBiZSBzb21l
dGhpbmcgd3JvbmcgZ29pbmcgb24uCgpXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcywKRHdhaXBh
eWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
