Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924D8C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 07:24:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6FA82067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 07:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blIZh/hq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6FA82067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 357CD85207;
	Mon,  9 Nov 2020 07:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxZ2iXUyKgkb; Mon,  9 Nov 2020 07:24:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18B38850ED;
	Mon,  9 Nov 2020 07:24:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1439DC0889;
	Mon,  9 Nov 2020 07:24:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 530EAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 07:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C0B884B37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 07:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O19cPRxu93sP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 07:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A5A1F84AC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 07:24:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c66so1560186pfa.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 23:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lqMYwwMl0ypEimyxNBVna3vHcWpc7jgH7vZyN2G5QD0=;
 b=blIZh/hqJGkQtDcSvMEQ0sS2bCYWiVTFhH5wiuXxfpuVTu9drxOImK5VNQEHy/E8kC
 8elmHPlnfMv7qvz97GoYYeE7w5oU3oY7zLOXoQqteCCfei56Nlz6jcqsuXZYckp2KPAA
 FwSuiHBeNFjprasRknDB79TP6llXm/xoIIuCPsyqW4SOEk4z9NRXMgtxZxnjKGfxk7cc
 OmeO3ZiqVtAOf9rbxbV2hQ9+E68rLwqgF6DTvAEKtIExPPH4aqMEWa9g6LaUbvWXt33d
 vrXlvtLUOLovAPjbdBRfOFWX/h+eFz17xM+m6tr+rLqwjErz6y9N44fIVZVlh8coPDIG
 gcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lqMYwwMl0ypEimyxNBVna3vHcWpc7jgH7vZyN2G5QD0=;
 b=AExlxODWGWLwqJyvRGWqY94SnH7lhq5oVURpNj5QFNk/8n67tcNlb1h8axWHfzobs4
 j2tn4VX1YFC9p2igA1NWiOF5IinClOfnsWeslxN2C0+MIDv9cBNyHHe5STjjRgIR5ll1
 CkgjFnkjbjsF+oNKfMHj1VoNSmPlERbbDeO+TNk9dbmUWXiBaTi59OHCOZycpNkZxjOd
 AAXqDGcOB9g05nn9oO4CDbuy6x0PVXUJBUSiFNlqUK+1xuy6QtTwDRUTLP0qavszGb1z
 27fmofvQnDDwj4S8A8OsgxxQnLBjusBo63M3jayILiUo6gLufjqZIUW51VQRoff/5wsa
 CpOw==
X-Gm-Message-State: AOAM533xIQq4lbhBvZCdJzYsYF4xJHi0Ihrq0Khl3JOPcpHP+e3BN1k6
 3nZk5mW3cme49PMilucQnkI=
X-Google-Smtp-Source: ABdhPJydcUYEfCdapfYosHMqKKc2du+YyBB5AuS530hat/9V373/Lh577nYI7mVZZ5C/4iy0V/KCJA==
X-Received: by 2002:a65:4cc9:: with SMTP id n9mr12183722pgt.236.1604906662983; 
 Sun, 08 Nov 2020 23:24:22 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:19be:b84e:68cf:38c6:95bd?
 ([2402:3a80:415:19be:b84e:68cf:38c6:95bd])
 by smtp.gmail.com with ESMTPSA id y8sm10200089pfe.33.2020.11.08.23.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 23:24:22 -0800 (PST)
To: Joe Perches <joe@perches.com>
References: <20201108134317.25400-1-yashsri421@gmail.com>
 <e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9a5411a0-0f47-71ef-5dd5-404bf20154e6@gmail.com>
Date: Mon, 9 Nov 2020 12:54:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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

T24gOS8xMS8yMCAxOjI3IGFtLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBTdW4sIDIwMjAtMTEt
MDggYXQgMTk6MTMgKzA1MzAsIEFkaXR5YSBTcml2YXN0YXZhIHdyb3RlOgo+PiBDdXJyZW50bHks
IGNoZWNrcGF0Y2ggd2FybnMgdXMgaWYgdGhlIGF1dGhvciBvZiB0aGUgY29tbWl0IHNpZ25zLW9m
Zgo+PiBhcyBjby1kZXZlbG9wZWQtYnkuCj4gW10KPj4gQSBxdWljayBtYW51YWwgY2hlY2sgZm91
bmQgb3V0IHRoYXQgYWxsIGZpeGVzIHdlcmUgY29ycmVjdCBpbiB0aG9zZQo+PiBjYXNlcy4KPiBb
XQo+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9jaGVja3Bh
dGNoLnBsCj4gW10KPj4gQEAgLTI4MjcsOCArMjgyNywxMSBAQCBzdWIgcHJvY2VzcyB7Cj4+IMKg
IyBDaGVjayBDby1kZXZlbG9wZWQtYnk6IGltbWVkaWF0ZWx5IGZvbGxvd2VkIGJ5IFNpZ25lZC1v
ZmYtYnk6IHdpdGggc2FtZSBuYW1lIGFuZCBlbWFpbAo+PiDCoAkJCWlmICgkc2lnbl9vZmYgPX4g
L15jby1kZXZlbG9wZWQtYnk6JC9pKSB7Cj4+IMKgCQkJCWlmICgkZW1haWwgZXEgJGF1dGhvcikg
ewo+PiAtCQkJCQlXQVJOKCJCQURfU0lHTl9PRkYiLAo+PiAtCQkJCQkgICAgICAiQ28tZGV2ZWxv
cGVkLWJ5OiBzaG91bGQgbm90IGJlIHVzZWQgdG8gYXR0cmlidXRlIG5vbWluYWwgcGF0Y2ggYXV0
aG9yICckYXV0aG9yJ1xuIiAuICIkaGVyZVxuIiAuICRyYXdsaW5lKTsKPj4gKwkJCQkJaWYgKFdB
Uk4oIkJBRF9TSUdOX09GRiIsCj4+ICsJCQkJCQkgIkNvLWRldmVsb3BlZC1ieTogc2hvdWxkIG5v
dCBiZSB1c2VkIHRvIGF0dHJpYnV0ZSBub21pbmFsIHBhdGNoIGF1dGhvciAnJGF1dGhvcidcbiIg
LiAiJGhlcmVcbiIgLiAkcmF3bGluZSkgJiYKPj4gKwkJCQkJICAgICRmaXgpIHsKPj4gKwkJCQkJ
CWZpeF9kZWxldGVfbGluZSgkZml4bGluZW5yLCAkcmF3bGluZSk7Cj4+ICsJCQkJCX0KPj4gwqAJ
CQkJfQo+PiDCoAkJCQlpZiAoIWRlZmluZWQgJGxpbmVzWyRsaW5lbnJdKSB7Cj4+IMKgCQkJCQlX
QVJOKCJCQURfU0lHTl9PRkYiLAo+IAo+IExvb2tzIE9LIHRvIG1lLgo+IAo+IEFub3RoZXIgb3B0
aW9uIG1pZ2h0IGJlIHRvIGFkZCBhIFNpZ25lZC1vZmYtYnk6IGxpbmUgZGVyaXZlZCBmcm9tCj4g
YW55ICJGcm9tOiIgbGluZSB3aGVuOgo+IAo+IAlpZiAoJGlzX3BhdGNoICYmICRoYXNfY29tbWl0
X2xvZyAmJiAkY2hrX3NpZ25vZmYpIHsKPiAJCWlmICgkc2lnbm9mZiA9PSAwKSB7Cj4gCQkJRVJS
T1IoIk1JU1NJTkdfU0lHTl9PRkYiLAo+IAkJCSAgICAgICJNaXNzaW5nIFNpZ25lZC1vZmYtYnk6
IGxpbmUocylcbiIpOwo+IAo+IGV0Yy4uLgo+IAoKWWVzLCBJIGp1c3Qgbm90aWNlZC4gVGhhbmtz
IGZvciB0aGUgc3VnZ2VzdGlvbi4gV2lsbCBkby4KClRoYW5rcwpBZGl0eWEKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMg
bWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgta2VybmVsLW1lbnRlZXMK
