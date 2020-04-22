Return-Path: <SRS0=uLYh=6G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F7BC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 19:09:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F54720767
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 19:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf2OOUKI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F54720767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E37CC226D0;
	Wed, 22 Apr 2020 19:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8P53IvcrhpE; Wed, 22 Apr 2020 19:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9AA4A22049;
	Wed, 22 Apr 2020 19:09:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 805E2C1D7D;
	Wed, 22 Apr 2020 19:09:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 407A9C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 19:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B4AF226D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 19:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDD5u6Fqgh8L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 19:09:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A036222049
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 19:09:08 +0000 (UTC)
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34CB020644;
 Wed, 22 Apr 2020 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587582548;
 bh=6Ly8yi5EuAbtrfiApCRKnWIYYBg4yEzKxRpBSUGmZ8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pf2OOUKI3NNfkOxFTQwgcc0YFYOfwDY7NubBP0kiN9kR6vyi9CRJC+q9+JQnd+Hdu
 NpzqDtL3Tn4ZHFuQM1G0pw4u5l2F7gN54olGAQP0QFjXbJeZ/hqo/gyPuknhZuANtF
 PD1puOJCgOSHVkuWLv2EAZUBNohD7S2/UnRG5o9E=
Date: Wed, 22 Apr 2020 21:09:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200422210903.6a99a51d@coco.lan>
In-Reply-To: <83e58149-42ea-8067-780d-6569b4dd6a79@gmail.com>
References: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
 <20200420083617.7cdcbd1c@coco.lan>
 <bd14efb7-6144-1e0d-7cff-459f6d1c9a94@gmail.com>
 <20200421124552.6efe8ef7@coco.lan>
 <83e58149-42ea-8067-780d-6569b4dd6a79@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Jonathan Corbet <corbet@lwn.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Is anyone working on fixing warnings
 these Documentation files ?
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

RW0gV2VkLCAyMiBBcHIgMjAyMCAxOTo1Mzo0MiArMDIwMApTYWhlZWQgQm9sYXJpbndhIDxyZWZh
Y3Rvcm15c2VsZkBnbWFpbC5jb20+IGVzY3JldmV1OgoKPiBTb3JyeSBmb3IgdGFraW5nIGxvbmcg
dG8gcmVwbHkuCj4gCj4gSSB0aGluayBJIGdvdCBkaWZmZXJlbnQgd2FybmluZ3MgYmVjYXVzZSBJ
IHdhcyBjaGVja2luZyBmb3Igd2FybmluZ3Mgb24gCj4gdGhlIHN0YWJsZSB0cmVlLiBJIGdldCBh
IGRpZmZlcmVudCBzZXQgb2YKPiAKPiB3YXJuaW5ncyBub3cgd2l0aCBsaW51eC1uZXh0LsKgIEp1
c3QgdG8gY29uZmlybSwgaGVyZSBpcyB3aGF0IEkgYW0gZG9pbmc6Cj4gCj4gICAgIC0gdXBkYXRl
IG15IGxvY2FsIHJlcG8gdG8gbGludXgtbWFpbgo+IAo+ICAgICAtIHJ1biB0aGlzIGNvbW1hbmTC
oCBtYWtlIGh0bWxkb2NzID4gZG9jX21ha2UubG9nIDI+JjEKPiAKPiAgICAgLSBjaGVjayBkb2Nf
bWFrZS5sb2cgZm9yIHdhcm5pbmdzCgpObywgdGhlIGJlc3QgaXMgdG8gdXNlIHRoZSBsYXRlc3Qg
dGFnIGF0IGxpbnV4IG5leHQgKHdpdGggYXJlIHVwZGF0ZWQKZXZlcnkgZGF5KS4KClNvLCB5b3Ug
c2hvdWxkIGRvIHNvbWV0aGluZyBsaWtlOgoKCSMgaW4gY2FzZSB5b3VyIHRyZWUgaXMgbm90IGJh
c2VkIG9uIGxpbnV4LW5leHQ6CgkkIGdpdCByZW1vdGUgYWRkIGxpbnV4LW5leHQgZ2l0Oi8vZ2l0
aHViLmNvbS9zZnJvdGh3ZWxsL2xpbnV4LW5leHQuZ2l0CgoKVGhlbjoKCgkkIGdpdCBjaGVja291
dCAtYiBteV9kb2NzX25leHRfYnJhbmNoIG5leHQtMjAyMDA0MjIKCSQgbWFrZSBodG1sZG9jcwoK
VGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
