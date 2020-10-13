Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E2AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 08:53:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E679208D5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 08:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3Q3PwnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E679208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A93072E0F2;
	Tue, 13 Oct 2020 08:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qx78i0wPIFNe; Tue, 13 Oct 2020 08:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 137AF20362;
	Tue, 13 Oct 2020 08:53:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5BAFC0052;
	Tue, 13 Oct 2020 08:53:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89053C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 08:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7809B87475
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 08:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaEz73LvJtkg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 08:53:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB6EA87460
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 08:53:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b19so10319818pld.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LTR2IgYIK7xAE4oUdad2TPARaho3YwkIIRd1YoCTDVM=;
 b=M3Q3PwnXWnIwDY2TCh2iHM0A7Z2qWtd6gCLk9NA/7EpCajIEyAa1GGhCoxnVgEqjUq
 kNt69WifcadORjeHHrH4NiVFKK83XrW9w4uSnCT3AwoFEYQNJLKQ0Ug9BZbjW5rDrckb
 Lp9NC+XvqYlyRYEDQQ18i4yJCkS9ufgUugBF5ucz3Glr32wy4yQki7X4VYzqtNIHlzG8
 36HgX1HnEo+7tmZ9AyCKI3U/nv7aTa7jezeWzJShZeoz/nXxfjud/1gTuRqDOaTzXNU9
 rXSDvuSv2f0BulH+josCwUUyFpj58IW/KgBOvbxOQnlQNGpykrWnYU9mnKZ2h4xJUxN1
 XvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTR2IgYIK7xAE4oUdad2TPARaho3YwkIIRd1YoCTDVM=;
 b=nNqh6WsfTDlWeW02CMvCpjSMwhoeLxnLhhLCXEpLVzERLnhPhvFjRnmXBhiA3EZYQM
 jf351tLu9NnAH1e3AR43MCLkGSPmsrc4DmmFfK64PdxV1EKQ91+fOpnc2DOIoHAzBfiT
 ExG8kmgh3UQl/goDfsNAE+xeWtl4g2x+1ruFmnSfq/oP3p50KWAhVZqad47la2UoYdyF
 Rw9pkPKtKrVzTCT0I40TDNIPc8Lhe7zCvHZz1KctOMF+pZR0965dMIKTqglbBfGTud9N
 cSHbwKpsa4YuieLDgTpc8hGz4VkO4V+qeKlgdNkjm9F40rpq+cln5qVy3I+2cpC30utq
 qEfw==
X-Gm-Message-State: AOAM533Le6IcyL8Dz3UWSlyPXW3I+mYzjU0Nj+iBijC0BuoqyUbyXBuZ
 JxmhDxt/kUBgMtMwv0sBPtnZLmttzn6vJOHApZw=
X-Google-Smtp-Source: ABdhPJwfveAnvFxUuaP0Hm+IJS4rem56R3OLYskHyZskJpRTolMNEa7Xa7wqY/DEeNAriP4rdx4PTQ==
X-Received: by 2002:a17:902:9a87:b029:d2:1ec0:4373 with SMTP id
 w7-20020a1709029a87b02900d21ec04373mr26893765plp.40.1602579214036; 
 Tue, 13 Oct 2020 01:53:34 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id u18sm22943727pgk.18.2020.10.13.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:53:33 -0700 (PDT)
To: Brendan Higgins <brendanhiggins@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200817043028.76502-1-98.arpi@gmail.com>
 <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
 <20200821113710.GA26290@alley> <20200821122849.GS1891694@smile.fi.intel.com>
 <20201012204625.GA56597@google.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <41038b5a-5821-a27b-ff6e-fb9f0054940b@gmail.com>
Date: Tue, 13 Oct 2020 14:23:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012204625.GA56597@google.com>
Content-Language: en-US
Cc: Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
	KUnit
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

T24gMTMvMTAvMjAgMjoxNiBhbSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDIxLCAyMDIwIGF0IDAzOjI4OjQ5UE0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4g
T24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMDE6Mzc6MTBQTSArMDIwMCwgUGV0ciBNbGFkZWsgd3Jv
dGU6Cj4+PiBPbiBNb24gMjAyMC0wOC0xNyAwOTowNjozMiwgUmFzbXVzIFZpbGxlbW9lcyB3cm90
ZToKPj4+PiBPbiAxNy8wOC8yMDIwIDA2LjMwLCBBcnBpdGhhIFJhZ2h1bmFuZGFuIHdyb3RlOgo+
Pj4+PiBDb252ZXJ0cyB0ZXN0IGxpYi90ZXN0X3ByaW50Zi5jIHRvIEtVbml0Lgo+Pj4+PiBNb3Jl
IGluZm9ybWF0aW9uIGFib3V0IEtVbml0IGNhbiBiZSBmb3VuZCBhdAo+Pj4+PiBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kZXYtdG9vbHMva3VuaXQvaW5kZXguaHRtbC4K
Pj4+Pj4gS1VuaXQgcHJvdmlkZXMgYSBjb21tb24gZnJhbWV3b3JrIGZvciB1bml0IHRlc3RzIGlu
IHRoZSBrZXJuZWwuCj4+Pj4KPj4+PiBTbyBJIGNhbiBjb250aW51ZSB0byBidWlsZCBhIGtlcm5l
bCB3aXRoIHNvbWUgYXBwcm9wcmlhdGUgQ09ORklHIHNldCB0bwo+Pj4+IHksIGJvb3QgaXQgdW5k
ZXIgdmlydC1tZSwgcnVuIGRtZXNnIGFuZCBzZWUgaWYgSSBicm9rZSBwcmludGY/IFRoYXQncwo+
Pj4+IHdoYXQgSSBkbyBub3csIGFuZCBJIGRvbid0IHdhbnQgdG8gaGF2ZSB0byBzdGFydCB1c2lu
ZyBzb21lIGVudGVycHJpc3kKPj4+PiBmcmFtZXdvcmsuCj4+Pgo+Pj4gSSBoYWQgdGhlIHNhbWUg
Y29uY2Vybi4gSSBoYXZlIHRyaWVkIGl0Lgo+IAo+IFNvcnJ5IHlvdSBmZWVsIHRoYXQgd2F5LiBE
byB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gaG93IHdlIGNhbiBtYWtlCj4gaXQgc2VlbSBs
ZXNzIGVudGVycHJpc3k/IFNlZW1zIGxpa2UgdGhlcmUgYXJlIHBlb3BsZSBoZXJlIHdobyBhcmUg
bm90IGEKPiBmYW4gb2YgdGhlIG91dHB1dCBmb3JtYXQsIHNvIG9mIHdoaWNoIHdlIGNhbiBmaXgg
aGVyZSwgc29tZSBvZiB3aGljaCBpcwo+IHBhcnQgb2YgS1RBUFsxXS4KPiAKPj4gV2hpY2ggcmFp
c2VzIGFuIG9idmlvdXMgcXVlc3Rpb246IGRpZCB0aGUgcGVvcGxlIHdobyBjb252ZXJ0IHRoaXMg
dGVzdCB0aGlzCj4+IHRoZW1zZWx2ZXM/IExvb2tzIGxpa2UgYSBqYW5pdG9yIHdvcmsgaW4gdGhl
IGFyZWEgd2l0aG91dCB1bmRlcnN0YW5kaW5nIHRoZQo+PiBhcmVhIGdvb2QgZW5vdWdoLgo+IAo+
IExvb2tzIHRvIG1lIGxpa2UgQXJwaXRoYSByYW4gaXQsIGJ1dCB5b3UgYXJlIHJpZ2h0LCB3ZSBk
b24ndCBoYXZlIGEgbG90Cj4gb2YgZmFtaWxpYXJpdHkgd2l0aCB0aGlzIGFyZWE7IHdlIHdlcmUg
dHJlYXRpbmcgaXQgYXMgImphbml0b3Igd29yayIgYXMKPiB5b3Ugc2F5Lgo+IAo+IE91ciBpbnRl
bnRpb24gd2FzIGp1c3QgdG8gdGFrZSBzb21lIGV4aXN0aW5nIHRlc3RzIGFuZCBhcyBub24taW52
YXNpdmVseQo+IGFzIHBvc3NpYmxlLCBnZXQgdGhlbSB0byByZXBvcnQgdXNpbmcgYSBjb21tb24g
Zm9ybWF0LCBhbmQgbWF5YmUgZXZlbgo+IGdldCBzb21lIG9mIHRoZSB0ZXN0cyB0byBmb2xsb3cg
YSBjb21tb24gcGF0dGVybi4KPiAKPj4gUHJvYmFibHkgSSB3aWxsIE5BSyBhbGwgdGhvc2UgcGF0
Y2hlcyBmcm9tIG5vdyBvbiwgdW50aWwgaXQgd2lsbCBiZSBnb29kIGNvbW1pdAo+PiBtZXNzYWdl
cyBhbmQgY292ZXIgb2YgcmlzZW4gYXNwZWN0cywgaW5jbHVkaW5nIHJlZmVyZW5jZSB0byBiZWZv
cmUgYW5kIGFmdGVyCj4+IG91dGNvbWUgZm9yIHBhc3NlZCBhbmQgZmFpbGVkIHRlc3QgY2FzZXMu
Cj4gCj4gRmFpciBlbm91Z2gsIGhvcGVmdWxseSB3ZSBjYW4gYWRkcmVzcyB0aGVzZSBpc3N1ZXMg
aW4gdGhlIG5leHQgcmV2aXNpb24uCj4gCj4gT25lIGlzc3VlIHRob3VnaCwgd2l0aCB0aGUgImJl
Zm9yZSBhbmQgYWZ0ZXIgb3V0Y29tZSIgeW91IGFyZQo+IHJlZmVyZW5jaW5nOyBhcmUgeW91IHJl
ZmVycmluZyB0byB0aGUgaXNzdWUgdGhhdCBQZXRyIHBvaW50ZWQgb3V0IGluIGhvdwo+IHRoZXkg
YXJlIGluY29uc2lzdGVudDoKPiAKPiDCoCDCoCsgb3JpZ2luYWwgY29kZTogdnNucHJpbnRmKGJ1
ZiwgNiwgIiVwaTR8JXBJNCIsIC4uLikgd3JvdGUgJzEyNy4wJywgZXhwZWN0ZWQgJzEyNy0wJwo+
IMKgIMKgKyBrdW5pdCBjb2RlOiB2c25wcmludGYoYnVmLCAyMCwgIiVwaTR8JXBJNCIsIC4uLikg
d3JvdGUgJzEyNy4wMDAuMDAwLjAwMXwxMjcnLCBleHBlY3RlZCAnMTI3LTAwMC4wMDAuMDAxfDEy
NycgwqAKPiAKPiAoSSB0aGluayBSYXNtdXMgYWRkcmVzc2VkIHRoaXMuKSBPciBhcmUgeW91ciBy
ZWZlcnJpbmcgdG8gc29tZXRoaW5nCj4gZWxzZT8KPiAKPj4gQnJlbmRhbiwgSSBndWVzcyB0aGUg
YmFsbCBub3cgb24geW91ciBzaWRlIHRvIHByb3ZlIHRoaXMgaXMgZ29vZCBhY3Rpdml0eS4KPiAK
PiBBbmQgSSBzZWUgdGhhdCB3ZSBhcmUgb2ZmIHRvIGEgZ3JlYXQgc3RhcnQhIDotKQo+IAo+IElu
IGFsbCBzZXJpb3VzbmVzcywgSSBhbSByZWFsbHkgc29ycnkgYWJvdXQgdGhpcy4gSSBraW5kIG9m
IGJ1bmdsZWQgdGhpcwo+IHVwIHRyeWluZyB0byBnbyBhZnRlciB0b28gbWFueSBvZiB0aGVzZSBj
b252ZXJzaW9ucyBhdCBvbmNlLgo+IAo+IEFycGl0aGEsIGNhbiB5b3UgZ2V0IHRoaXMgZm9sbG93
IHVwIHBhdGNoIG91dD8KPiAKClllcywgSSB3aWxsIHdvcmsgb24gdGhpcy4KCj4gWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtzZWxmdGVzdC9DWTRQUjEzTUIxMTc1QjgwNEUzMUU1
MDIyMjFCQzgxNjNGRDgzMEBDWTRQUjEzTUIxMTc1Lm5hbXByZDEzLnByb2Qub3V0bG9vay5jb20v
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
