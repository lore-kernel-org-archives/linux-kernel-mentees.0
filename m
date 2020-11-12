Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1EFC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 17:35:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C44ED20791
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 17:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7SK945+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C44ED20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1247587839;
	Thu, 12 Nov 2020 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bo+kjEEPp6QE; Thu, 12 Nov 2020 17:35:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94B6787837;
	Thu, 12 Nov 2020 17:35:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C12BC088B;
	Thu, 12 Nov 2020 17:35:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD8AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6895887838
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 17:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3178zChFDUGl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 17:35:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A456B87837
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 17:35:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id g7so5210456pfc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 09:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m6uf91hMLb6EsIydKTIun8Uz59jrhVBq4rirCJruXXQ=;
 b=B7SK945+G9LOGWC/0xHv8V2Wa6GV4qDCmH23tVkfQoQVjQI5yr5tTiIvfDQZBITDfH
 bR+dckejmqaEAqVRgkzwVZN0QJcqWceHgi81Ysl+wOKo01o/EH0Y1OwAk7L2rjt6wYg5
 GDDtBW5f4Vbhf4uf0KSbE/71UlzAeyc6lmuYZ1Lky1mX1og8boqUMH1aFBdj+iFb/+zF
 C09nABPaELinMZ/biInnKbvApZtNUfPddvoPn2FXR9tRlJ8QxK2gDQAC5RvpsHfFwBsf
 bpkNid9zcIjFpKrkILDWPDFDif2WKIGc5uhtstkGL6hNSzGY6bJKepCuP5mDJ1QZoVcs
 UV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6uf91hMLb6EsIydKTIun8Uz59jrhVBq4rirCJruXXQ=;
 b=mthZZuhoLpCwQkgU9QPa/aN6xkMjJEEL+a91IgACpgPnyGKEwUPPkdpnBgnrP+WzUj
 OJeNtCQ5OB4hF90yCzdowI69Tl3thbTTTEW0pv7rZcvUx2Hz3nTRJdgNu4jm/SAp04Rb
 5foGvfKOd1ljkbM6H08otDnFYIckmMVN9FECYN/D44c1dSS6dqVZ05lI5KvH7hEf+OuR
 oHAulrZcmmmEJbUcAAI0DLmyVQ35GxQXGi1ycahHZ6KnjAFOn8kVXvejjUqL5LZPFnvD
 N9dxWYkUmNDTg4QQXEeYy3TqMcV2r2i3usM2ICjMGS4qwzeg1UnPN4fTXgh17yyHjuj/
 ku8g==
X-Gm-Message-State: AOAM530KLWQh30Z2UIt4YhhIGGcEqnL4Sn60NbA9080t1bqYBU5gIHz8
 R53QovuWQB0E+6LgFJjcphfljtbOhJc7gmO+
X-Google-Smtp-Source: ABdhPJx3IAAGNECbF4j3QFbbGmylrYH+eQVK9ux1e4JNmN3XhYrpw5jkMZmAVPWpKsakosTeOaGz4Q==
X-Received: by 2002:a63:ba1d:: with SMTP id k29mr461408pgf.179.1605202550791; 
 Thu, 12 Nov 2020 09:35:50 -0800 (PST)
Received: from ?IPv6:2402:3a80:431:ca3d:d81d:4531:78f5:b367?
 ([2402:3a80:431:ca3d:d81d:4531:78f5:b367])
 by smtp.gmail.com with ESMTPSA id w196sm6789139pfd.177.2020.11.12.09.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 09:35:50 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
 <155d1824-799f-8994-ec03-a1207928e8c7@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6a441b7a-a567-6579-be1c-849604191a07@gmail.com>
Date: Thu, 12 Nov 2020 23:05:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <155d1824-799f-8994-ec03-a1207928e8c7@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

T24gMTIvMTEvMjAgMTA6MTAgcG0sIER3YWlwYXlhbiBSYXkgd3JvdGU6Cj4gCj4gT24gMTIvMTEv
MjAgMTowNSBhbSwgQWRpdHlhIHdyb3RlOgo+PiBPbiAxMi8xMS8yMCAxMjo1NiBhbSwgTHVrYXMg
QnVsd2FobiB3cm90ZToKPj4+IE9uIFdlZCwgTm92IDExLCAyMDIwIGF0IDg6MjAgUE0gQWRpdHlh
IFNyaXZhc3RhdmEKPj4+IDx5YXNoc3JpNDIxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gQ3VycmVu
dGx5IGNoZWNrcGF0Y2ggd2FybnMgdXMgZm9yIGxvbmcgbGluZXMgaW4gY29tbWl0cyBldmVuIGZv
cgo+Pj4+IHNpZ25hdHVyZSB0YWcgbGluZXMuCj4+Pj4KPj4+PiBFLmcuLCBydW5uaW5nIGNoZWNr
cGF0Y2ggb24gY29tbWl0IDRiYmRmZTI1NjAwYyAoIklCL29wYV92bmljOgo+Pj4+IFByb3Blcmx5
Cj4+Pj4gY2xlYXIgTWFjIFRhYmxlIERpZ2VzdCIpIHJlcG9ydHMgdGhpcyB3YXJuaW5nOgo+Pj4+
Cj4+Pj4gV0FSTklORzogUG9zc2libGUgdW53cmFwcGVkIGNvbW1pdCBkZXNjcmlwdGlvbiAocHJl
ZmVyIGEgbWF4aW11bQo+Pj4+IDc1IGNoYXJzIHBlciBsaW5lKQo+Pj4+IFJldmlld2VkLWJ5OiBO
aXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4+Pj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFA
aW50ZWwuY29tPgo+Pj4+Cj4+Pj4gVGhpcyBpcyBhbiBleGFtcGxlIG9mIGZhbHNlIHBvc2l0aXZl
LiBQcm92aWRlIGEgZml4IGJ5IGV4Y2x1ZGluZwo+Pj4+IHNpZ25hdHVyZSB0YWcgbGluZXMgZnJv
bSB0aGlzIGNsYXNzIG9mIHdhcm5pbmcuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEg
U3JpdmFzdGF2YSA8eWFzaHNyaTQyMUBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgc2NyaXB0
cy9jaGVja3BhdGNoLnBsIHwgMiArKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwKPj4+PiBpbmRleCBhYzdlNWFjODBiNTguLjFkMjU3YjFmNGE0ZiAx
MDA3NTUKPj4+PiAtLS0gYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPj4+PiArKysgYi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwKPj4+PiBAQCAtMjk2Myw2ICsyOTYzLDggQEAgc3ViIHByb2Nlc3Mgewo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgZmlsZW5hbWUgdGhlbiA6Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJGxpbmUgPX4gL15ccyooPzpG
aXhlczp8TGluazopL2kgfHwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIEEgRml4ZXM6
IG9yIExpbms6IGxpbmUKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAkbGluZSA9fiAvXlxzKig/OiRzaWduYXR1cmVfdGFncykvIHx8Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIyBzaWduYXR1cmUgdGFnIGxpbmUKPj4+IENhbiB5b3Ugc2ltcGx5IGFkZCB0
aGlzIGNoZWNrIHRvIHRoZSBleHByZXNzaW9uIGFib3ZlPwo+Pj4KPj4gWWVzLCB3ZSBjYW4gZG8g
aXQuIEJ1dCB0aGVuIHRoZSBtYXRjaCB3aWxsIGJlY29tZSBjYXNlIGluc2Vuc2l0aXZlCj4+IChi
ZWNhdXNlIG9mIHByZXNlbmNlIG9mICcvaScpLiBTaG91bGQgSSBkbyBpdCBpcnJlc3BlY3RpdmU/
Cj4+Cj4+IFRoYW5rcwo+PiBBZGl0eWEKPj4KPiBJIHRoaW5rIHRoZSBjaGVjayBtaWdodCBiZSBi
ZXR0ZXIgYXMgY2FzZSBpbnNlbnNpdGl2ZSBiZWNhdXNlOgo+IAo+ICQgZ2l0IGxvZyAtLWZvcm1h
dD1lbWFpbCAtMTAwMDAwIHwgZ3JlcCAiXkNDOiIgfCB3YyAtbAo+IDc3Mwo+IAo+ICQgZ2l0IGxv
ZyAtLWZvcm1hdD1lbWFpbCAtMTAwMDAwIHwgZ3JlcCAiXkNjOiIgfCB3YyAtbAo+IDU5NDc1Cj4g
Cj4gJCBnaXQgbG9nIC0tZm9ybWF0PWVtYWlsIC0xMDAwMDAgfCBncmVwICJeY2M6IiB8IHdjIC1s
Cj4gOTUKPiAKPiBBbGwgdGhyZWUgY2FzZXMgd2VyZSB1c2VkIGZvciBDYzogLi4uCj4gCj4gVGhh
bmtzLAo+IER3YWlwYXlhbi4KPiAKClRoYW5rcyBEd2FpcGF5YW4uIFlvdSBzZWVtIHRvIGJlIGNv
cnJlY3QuIEkganVzdCBvYnNlcnZlZCwgd2UgYXJlCmFscmVhZHkgdXNpbmcgJy94aScgZmxhZ3Mg
d2l0aCAkc2lnbmF0dXJlX3RhZ3MgdmFsdWVzIGl0c2VsZi4gU28sIGNhc2UKaW5zZW5zaXRpdmUg
cGFydCBzZWVtcyBhbHJlYWR5IGNvdmVyZWQuCgpJIHRoaW5rIEkgY2FuIG1vZGlmeSB0aGUgY2hh
bmdlcyB0byBpbmNsdWRlIHRoaXMgY2hlY2sgaW4gdGhlIHByZXZpb3VzCmlmLWJsb2NrIGl0c2Vs
ZiBhcyBTaXIgaGFkIHN1Z2dlc3RlZCBpbml0aWFsbHkuIFRoaXMgc2hvdWxkbid0IGNoYW5nZQpv
dXIgZXZhbHVhdGlvbiBhcyB3ZWxsLgoKU2lyLCBzaG91bGQgSSBtYWtlIHRoZSBjaGFuZ2VzIGFz
IHlvdSBzdWdnZXN0ZWQgaW5pdGlhbGx5IG9yIHNob3VsZCB3ZQpwcm9jZWVkIHdpdGggaXQ/CgpU
aGFua3MKQWRpdHlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
