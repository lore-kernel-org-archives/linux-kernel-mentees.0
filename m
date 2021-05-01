Return-Path: <SRS0=C2G1=J4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D83C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 10:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B404613C6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 10:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B404613C6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA73E85387;
	Sat,  1 May 2021 10:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ylh4d1CHjuh6; Sat,  1 May 2021 10:23:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E907885385;
	Sat,  1 May 2021 10:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4A4CC000D;
	Sat,  1 May 2021 10:23:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7469C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 10:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9945A6075D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 10:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3neQ7iY1FJz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 10:23:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1315D606CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 10:23:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D0E4613C6;
 Sat,  1 May 2021 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619864612;
 bh=ZQ5/Bd9dgaWBN1kInWuLHSCQJfYNRchdvGct/JB3d3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7OtcFmn7uZbMMZgIoz71UxbAOtt1ZlsZyTtBaRbiHUcMSACrg3Y0aH1KQ/7XTbXj
 ZU5N2gQ5WVzR70B0qq79PD9xZVUYG/MbQjr2RHiineUfACMcSOtcL3Yl93x8kQrLeG
 AJISZopmfGvCq8I681FMERnyZcgJ+oym+OyqZEzE=
Date: Sat, 1 May 2021 12:23:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] rapidio: remove unused variable in rio_cm.c
Message-ID: <YI0sIoDv6H+aSyNE@kroah.com>
References: <20210501055018.9244-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210501055018.9244-1-mail@anirudhrb.com>
Cc: Alexandre Bounine <alex.bou9@gmail.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

T24gU2F0LCBNYXkgMDEsIDIwMjEgYXQgMTE6MjA6MTdBTSArMDUzMCwgQW5pcnVkaCBSYXlhYmhh
cmFtIHdyb3RlOgo+IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ3JjJyB0byBmaXggZ2NjIHdhcm5p
bmc6Cj4gCj4gCWRyaXZlcnMvcmFwaWRpby9yaW9fY20uYzogSW4gZnVuY3Rpb24g4oCYcmlvX3R4
Y3FfaGFuZGxlcuKAmToKPiAJZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jOjY3Mzo3OiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhyY+KAmSBzZXQgYnV0Cj4gCW5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuaXJ1ZGggUmF5YWJoYXJhbSA8bWFpbEBh
bmlydWRocmIuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmMgfCAzICstLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYyBiL2RyaXZlcnMvcmFwaWRpby9yaW9f
Y20uYwo+IGluZGV4IDUwZWM1M2Q2N2E0Yy4uNTQ1NjkzYmQ4NmEzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcmFwaWRpby9yaW9fY20uYwo+ICsrKyBiL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYwo+
IEBAIC02NzAsMTIgKzY3MCwxMSBAQCBzdGF0aWMgdm9pZCByaW9fdHhjcV9oYW5kbGVyKHN0cnVj
dCBjbV9kZXYgKmNtLCBpbnQgc2xvdCkKPiAgCSAqLwo+ICAJaWYgKCFsaXN0X2VtcHR5KCZjbS0+
dHhfcmVxcykgJiYgKGNtLT50eF9jbnQgPCBSSU9DTV9UWF9SSU5HX1NJWkUpKSB7Cj4gIAkJc3Ry
dWN0IHR4X3JlcSAqcmVxLCAqX3JlcTsKPiAtCQlpbnQgcmM7Cj4gIAo+ICAJCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShyZXEsIF9yZXEsICZjbS0+dHhfcmVxcywgbm9kZSkgewo+ICAJCQlsaXN0
X2RlbCgmcmVxLT5ub2RlKTsKPiAgCQkJY20tPnR4X2J1ZltjbS0+dHhfc2xvdF0gPSByZXEtPmJ1
ZmZlcjsKPiAtCQkJcmMgPSByaW9fYWRkX291dGJfbWVzc2FnZShjbS0+bXBvcnQsIHJlcS0+cmRl
diwgY21ib3gsCj4gKwkJCXJpb19hZGRfb3V0Yl9tZXNzYWdlKGNtLT5tcG9ydCwgcmVxLT5yZGV2
LCBjbWJveCwKPiAgCQkJCQkJICByZXEtPmJ1ZmZlciwgcmVxLT5sZW4pOwoKV2h5IG5vdCBoYW5k
bGUgdGhlIHBvdGVudGlhbCBlcnJvciBzZW50IGhlcmU/Cgp0aGFua3MsCgpncmVnIGstaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
