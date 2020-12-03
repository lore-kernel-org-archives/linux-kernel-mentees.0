Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68874C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 09:59:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA00E206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 09:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA00E206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0E3DB2E2D5;
	Thu,  3 Dec 2020 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cXKsTolx2Az; Thu,  3 Dec 2020 09:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1BA8D2E2D0;
	Thu,  3 Dec 2020 09:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D7EDC163C;
	Thu,  3 Dec 2020 09:59:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4475FC0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 09:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BA058796B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 09:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cchDsUF4JsaF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 09:59:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9A19A87969
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 09:59:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x4so854357pln.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Dec 2020 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q69KsiFydwKCuMI7D00S2So//GnJB60DE1anI6+oqlc=;
 b=MaGLUSpxokzJi81vFpAWPMRHIXOfWZ+f4BaMrGtcSlOO1g15+I9n3VBwa4gW7xeHby
 j3GA9BK/+Za3GqZhBjE8/DQ+GgU5VAWDV/Dm2SA5PZGAN4Kk5zAaA4IWyvoB4YzjNlX4
 4LxLhaAbnGMWSKlLjNYsiaJD3/FSzHWDZgCCRzofgUh+zCq6mirH+GQm+GZfB9k7Nd9S
 2BtpHrhhEifZ511+WmUT8Z7RMcGT3m3PLhe3dTGsvj05iFgrxvkDOdfULSvFypHJk6FN
 wwJLopNippi+Vc1OmaJ7Xkp65aeLIapydugivjp7h1wCBEprx0x50J6PlfL3EfYo6hrF
 B1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q69KsiFydwKCuMI7D00S2So//GnJB60DE1anI6+oqlc=;
 b=UcqZsOWmIjMbyHuKwTc+A2l/NN2D+MqNp8eG+Aos9sO5ENXqH0od+elgFdJ2MtcKDr
 fPGivi64x1rAw+IOTHiPC9GjZOXiWjtrwYkInptqJmjRMK+K/1jn7nFeUW11NBgxSMdD
 nGCbKNYnA5DJFyIOhRpg2/R+U8vRYMnCyHMapdAuuVCzuwU3fNxJ1YqHYYB8bBBzX4dg
 b3ihVQGCjLfba6mmkyZ9OcOHlDwAEQUgzds3Bk6+kBrC+4naPESnYwSTM39i0+5lxR4Y
 gTctKff2lthzjj1JSawye/C9/O93QtyTzG0ugjrjbmj6Bv36SFKQtrVEKzt9PG/nlRgH
 bLAQ==
X-Gm-Message-State: AOAM532yatYh28bqVawQXmwTE9AXZOkKwv1PLsloS9uhJimb9RLOivsn
 Q6T59siiMrXlMBJDlOBzhG1jDK87PwbCJG0N
X-Google-Smtp-Source: ABdhPJxf0qUiN0aXVwqbckesUIXrKA0YgpGp5M6GYDjpW/ZR2y1xB66cxWMDy1bx3pidWl8u+WCguQ==
X-Received: by 2002:a17:90b:a53:: with SMTP id
 gw19mr2355333pjb.216.1606989579772; 
 Thu, 03 Dec 2020 01:59:39 -0800 (PST)
Received: from [192.168.43.245] ([42.111.136.176])
 by smtp.gmail.com with ESMTPSA id y24sm1258100pfn.176.2020.12.03.01.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 01:59:39 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Joe Perches <joe@perches.com>
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
Message-ID: <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
Date: Thu, 3 Dec 2020 15:29:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
 non-standard signature - co-authored-by
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

T24gMy8xMi8yMCAxMjoyNiBhbSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gVGh1LCAyMDIwLTEy
LTAzIGF0IDAwOjAwICswNTMwLCBBZGl0eWEgU3JpdmFzdGF2YSB3cm90ZToKPj4gQ3VycmVudGx5
LCBjaGVja3BhdGNoLnBsIHdhcm5zIHVzIGZvciBCQURfU0lHTl9PRkYgb24gdGhlIHVzYWdlIG9m
Cj4+IG5vbi1zdGFuZGFyZCBzaWduYXR1cmVzLgo+Pgo+PiBBbiBldmFsdWF0aW9uIG9uIHY0LjEz
Li52NS44IHNob3dlZCB0aGF0IG91dCBvZiA1Mzkgd2FybmluZ3MgZHVlIHRvCj4+IG5vbi1zdGFu
ZGFyZCBzaWduYXR1cmVzLCA0MyBhcmUgZHVlIHRvIHRoZSB1c2Ugb2YgJ0NvLWF1dGhvcmVkLWJ5
Jwo+PiB0YWcsIHdoaWNoIG1heSBzZWVtIGNvcnJlY3QsIGJ1dCBpcyBub3Qgc3RhbmRhcmQuCj4+
Cj4+IFRoZSBzdGFuZGFyZCBzaWduYXR1cmUgZXF1aXZhbGVudCBmb3IgJ0NvLWF1dGhvcmVkLWJ5
JyBpcwo+PiAnQ28tZGV2ZWxvcGVkLWJ5Jy4KPiAKPiBJJ20gbm90IGdvaW5nIHRvIGFjayB0aGlz
IGFzIEkgZG9uJ3QgbWluZCBub24tc3RhbmRhcmQgc2lnbmF0dXJlcy4KPiAKCldoYXQgZG8geW91
IHN1Z2dlc3Q/ClNob3VsZCBJIGRyb3AgdGhpcyBwYXRjaCBhbmQgbW92ZSBvbj8KCj4gWW91IHNo
b3VsZCBhbHNvIGFsd2F5cyB1c2UgcGF0Y2ggc3ViamVjdCB2ZXJzaW9uaW5nIGFuZCBpbmNsdWRl
Cj4gYSBjaGFuZ2Vsb2cgYWZ0ZXIgdGhlIC0tLSBsaW5lLgo+IAoKT2ssIHdpbGwgZG8uIEFjdHVh
bGx5IEkgaGFkIG5vdCBpbmNsdWRlZCB0aGUgdmVyc2lvbiBjaGFuZ2Vsb2dzIGFuZAp2ZXJzaW9u
aW5nIGZyb20gb3VyIHByZXZpb3VzIHBhdGNoLCBhcyB0aGUgc3ViamVjdCBmb3IgdGhlIHBhdGNo
IGhhZApjaGFuZ2VkLiBXaWxsIGtlZXAgaW4gbWluZCBmb3IgZnV0dXJlIHRob3VnaC4KClRoYW5r
cwpBZGl0eWEKCj4+IFByb3ZpZGUgYSBmaXggYnkgc3VnZ2VzdGluZyB1c2VycyB3aXRoIHRoaXMg
c2lnbmF0dXJlIGFsdGVybmF0aXZlIGFuZAo+PiByZXBsYWNpbmcuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFkaXR5YSBTcml2YXN0YXZhIDx5YXNoc3JpNDIxQGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKg
c2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgMyArKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwKPj4gaW5kZXggNGEwMjY5MjYxMzlmLi5mYzAzNmQ1NDVkMmQgMTAw
NzU1Cj4+IC0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAo+PiArKysgYi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwKPj4gQEAgLTI4MzIsNiArMjgzMiw5IEBAIHN1YiBwcm9jZXNzIHsKPj4gwqAKPj4K
Pj4gwqAJCQlpZiAoJHNpZ25fb2ZmICF+IC8kc2lnbmF0dXJlX3RhZ3MvKSB7Cj4+IMKgCQkJCW15
ICRzdWdnZXN0ZWRfc2lnbmF0dXJlID0gZmluZF9zdGFuZGFyZF9zaWduYXR1cmUoJHNpZ25fb2Zm
KTsKPj4gKwkJCQlpZiAoJHNpZ25fb2ZmID1+IC9jby1hdXRob3JlZC1ieTovaSkgewo+PiArCQkJ
CQkkc3VnZ2VzdGVkX3NpZ25hdHVyZSA9ICJDby1kZXZlbG9wZWQtYnk6IjsKPj4gKwkJCQl9Cj4+
IMKgCQkJCWlmICgkc3VnZ2VzdGVkX3NpZ25hdHVyZSBlcSAiIikgewo+PiDCoAkJCQkJV0FSTigi
QkFEX1NJR05fT0ZGIiwKPj4gwqAJCQkJCSAgICAgIk5vbi1zdGFuZGFyZCBzaWduYXR1cmU6ICRz
aWduX29mZlxuIiAuICRoZXJlY3Vycik7Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
