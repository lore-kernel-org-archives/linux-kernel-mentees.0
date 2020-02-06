Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C530C352A2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:50:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D295A21741
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYVt6VTU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D295A21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 900CD2152E;
	Thu,  6 Feb 2020 11:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a+fcyOUCA649; Thu,  6 Feb 2020 11:50:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D18A0207A2;
	Thu,  6 Feb 2020 11:50:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B85A9C1D81;
	Thu,  6 Feb 2020 11:50:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76262C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 64C5C85F4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kd88Tg4A7rA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:50:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5CF0085F44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:50:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 6so2646278pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 03:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=y1yP9T56yxddmmADNHOP28JNy4LoPdf8IqN6O8c7yYU=;
 b=QYVt6VTUVuQNT5Mz4BfbcC8IedtpD8b8WAMFudFRrJPFD3L/Qa+l0Tac6tZZGxrSmf
 LLHlGoMzNPbfHqaF7yZuWf51RJh8hh4tgrPm1g5wqpGu4c0CoiODR2KwQg0jDwzNemdO
 YDDladhw34ikVjKoOEOJw5+ScRgLGpFXpSL3mMnse+FdXIKL0q2TntwRKuD6KTJKQDkb
 TkrzZSY5ZFupDJjJZ1F+YyfUHKqoKoS5/6Ch4723ryqeJZGf3Jo/Bj9bNhCAa5Dd4UuH
 qkNqPdYQriMe6V/9+IkxbI7TWxfgOBFmVUWVv5uN9EriSBJi4Ove/YvNv8/TxBub4zsf
 Jc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=y1yP9T56yxddmmADNHOP28JNy4LoPdf8IqN6O8c7yYU=;
 b=D11UXnSapSMnd20i/inZ++sg5OR8D7CHav+e4X+NkM5j/dDzK1Ojw6+UPG4k6rtHQE
 u6aPPGpJtVfDbKgHcLrHVGP+9pFlhPrPD2AjGyD2O/l/HY+zh8tSHwqCAcT9FZgC+y6n
 7dgEzNczpP/XKANztvpNPcxQx9/lPI108PxXBkVevUH97LufOw1r82z0kY9HbjTPPC2a
 6rRkqwVGGRCgrhGhx7hah8GiuR/HhoWirVnwcvLSzmaX2yDdWbkLlQ2GUQEgrRC0wUWT
 GntVIpfVkdSICnaS+pr1wNHYg9X+A4VSP6DhZl9ccm26xcI+H0sxZA9VVikiPWreyQXG
 xoeg==
X-Gm-Message-State: APjAAAUQ2O+vZQKQ7xeVSKBy6tXgBdazQMNNtLsCVtYlj3bUZg9oeSpP
 ToNUTUBCSaymA2dCYbJuzdQ=
X-Google-Smtp-Source: APXvYqy9Xm3mTLoczcOgH9ncFF+BoBtFzLa2JjPdumo3xp/w707hDTnBosioXLz2acLfqyEj06lUjA==
X-Received: by 2002:a63:c144:: with SMTP id p4mr3088873pgi.226.1580989805802; 
 Thu, 06 Feb 2020 03:50:05 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 h10sm3056502pfo.181.2020.02.06.03.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:50:05 -0800 (PST)
Message-ID: <e602666d72bb5a46a1f9f98cb1ee440b4c3dd16a.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 06 Feb 2020 17:20:00 +0530
In-Reply-To: <6e8147b7-da54-376f-0684-aee159e23d8e@web.de>
References: <6e8147b7-da54-376f-0684-aee159e23d8e@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 1/2] parsing_c: Align C
 AST and Cocci AST for pointers
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

T24gV2VkLCAyMDIwLTAyLTA1IGF0IDE5OjM2ICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiDigKYKPiA+ICsrKyBiL3BhcnNpbmdfYy9wcmV0dHlfcHJpbnRfYy5tbAo+ID4gQEAgLTgwNCwx
MSArODA0LDEyIEBAIGFuZCBwcF9zdHJpbmdfZm9ybWF0IChlLGlpKSA9Cj4gPiAgICAgICAgICAg
ICAgIChGdW5jdGlvblR5cGUgKHJldHVybj12b2lkLCBwYXJhbXM9aW50IGkpICopCj4gPiAgICAg
ICAgICAgICgqV1JPTkcgSSBUSElOSywgdXNlIGxlZnQgJiByaWdodCBmdW5jdGlvbiAqKQo+ID4g
ICAgICAgICAgICAoKiBidWc6IHBwX3R5cGVfd2l0aF9pZGVudF9yZXN0IE5vbmUgdDsgICAgICBw
cmludF9pZGVudAo+ID4gaWRlbnQgKikKPiA+ICsgICAgICAgICAgcHBfdHlwZV9sZWZ0IHQ7Cj4g
PiAgICAgICAgICAgIHByX2VsZW0gaTsKPiA+ICAgICAgICAgICAgaWlxdSArPiBMaXN0Lml0ZXIg
cHJfZWxlbTsgKCogbGUgY29uc3QgZXN0IGZvcmNlbWVudAo+ID4gYXByZXMgbGUgJyonICopCj4g
PiAgICAgICAgICAgIGlmIGlpcXUgPD4gW10gfHwgZ2V0X2NvbW1lbnRzX2FmdGVyIGkgPD4gW10K
PiA+ICAgICAgICAgICAgdGhlbiBwcl9zcGFjZSgpOwo+ID4gLSAgICAgICAgICBwcF90eXBlX3dp
dGhfaWRlbnRfcmVzdCBpZGVudCB0IGF0dHJzIEFzdF9jLm5vYXR0cjsKPiA+ICsgICAgICAgICAg
cHJpbnRfaWRlbnQgaWRlbnQKPiA+IAo+ID4gICAgICAgICgqIHVnbHkgc3BlY2lhbCBjYXNlIC4u
LiB0b2RvPyBtYXliZSBzdWZmaWNpZW50IGluIHByYWN0aWNlCj4gPiAqKQo+ID4gICAgICAgIHwg
KFBhcmVuVHlwZSB0dG9wLCBbaTE7aTJdKSAtPgo+IAo+IEFyZSB0aGUgc291cmNlIGNvZGUgY29t
bWVudHMgc3RpbGwgYXBwcm9wcmlhdGUgZm9yIHRoaXMgcGF0Y2ggaHVuaz8KPiAKCkkga25vdyB0
aGUgImxlIGNvbnN0IGVzdCBmb3JjZW1lbnQiIGNvbW1lbnQgaXMgc3RpbGwgYXBwcm9wcmlhdGUu
CgpUaGUgYnVnIGNvbW1lbnQgYWJvdmUgcHJvYmFibHkgc3RpbGwgaXMuCgpOb3Qgc28gc3VyZSBh
Ym91dCB0aGUgV1JPTkcgSSBUSElOSyBjb21tZW50LiBJJ20gdXNpbmcgcHBfdHlwZV9sZWZ0Cmhl
cmUsIGJ1dCBub3QgcHBfdHlwZV9yaWdodC4gT2YgY291cnNlLCB0aGF0IGlzIGlmIHRoZSBjb21t
ZW50IGlzIGluCnRoYXQgY29udGV4dC4KCkNoZWVycywKSmFza2FyYW4uCgo+IFJlZ2FyZHMsCj4g
TWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
