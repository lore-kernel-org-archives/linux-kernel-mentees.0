Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436A4C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 19:35:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B8B2389E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 19:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B8B2389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7086887AD2;
	Thu, 17 Dec 2020 19:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMoKfDvOUFPj; Thu, 17 Dec 2020 19:35:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F8A987AD1;
	Thu, 17 Dec 2020 19:35:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 342C8C088E;
	Thu, 17 Dec 2020 19:35:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A63DAC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 931C18781D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZjKf3ZNNFX5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D6455875FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 19:35:38 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id v29so20981386pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wPZrnA5/SetkiT4mAmTLqyH+8YY+s0za4WlgxwCw6jk=;
 b=CKi4msHEuMRaYQ8/7JWOfiZs5cZtUDrQJkcjMq53HqPd94CpGez6LZZuubVsZJ76Ls
 qj6GnshbiGyBh9k/8dsss+y4f2DoEj/NqRHzSq5xs1ozY+dfrMOydxKvQj8HnPMcXmzp
 tpAyZ8OZ3yLbllqzr8KTOVtF/WKbR31fBfhEkWKqD1sPtuOTXQQCKkwOBTDc0Stwipr5
 87zlI1z24qSJ6C/wR/nFnQKA1vjSnri0jnLL0Y8BRgAoHERy8njYgWWVE1aYX0kVPSWP
 IKCIRgDHATuxQF+tBSn2kxNRN4iQFtpo6VbrPvDSut8vaUE5FcCd4/canoZFJKUwMr3U
 n+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPZrnA5/SetkiT4mAmTLqyH+8YY+s0za4WlgxwCw6jk=;
 b=o/xAoyWlG7VObTmHJGNhl/o4QT56LmolAmkK2qI3aHdoOau6GKXj+L52YIpedc9qc6
 f3k8GgFhEdBAo9Pw2qGOHCAC3G6AtXh9+RMRYUAecL38H/19+uHfu8eia0k2wn6PfXNz
 EkRPdo+2umWWcaB6d1KfLEJS4DgKv+0pU3FNI75atco167B9oL94AFYCG0L1IvILZZ59
 10pieSiufKaDgxpT3V7D5hQbSCG60/GCermKLZ3a0yxkZHodkXhCFEjgiaXMU8iOfYtK
 9N9EInlb48oYMNrARsfxtz5lUdFGEKR1WCVnaFCA1UMWHtb+eoFYLlncODTFacGKOObb
 2btw==
X-Gm-Message-State: AOAM531eaoCPKhHBrwTqbkf3yVDEhfqsJ4bUWJSdHGyzoFSUvf6G/nIT
 NhGKDdfCM5KoJVcMOBNtr5s=
X-Google-Smtp-Source: ABdhPJw3/zoD3b3R02YffcY/DVXZyhW/+zU7UByVXTRwBnMbRT2BPFWzI2X9Wb50fd7//HDNp+9Zzg==
X-Received: by 2002:a63:2c93:: with SMTP id s141mr802674pgs.150.1608233738229; 
 Thu, 17 Dec 2020 11:35:38 -0800 (PST)
Received: from ?IPv6:2402:3a80:410:eec3:5d38:be:6298:62ae?
 ([2402:3a80:410:eec3:5d38:be:6298:62ae])
 by smtp.gmail.com with ESMTPSA id q11sm6980195pgh.16.2020.12.17.11.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 11:35:37 -0800 (PST)
To: Joe Perches <joe@perches.com>
References: <20201217134221.16178-1-yashsri421@gmail.com>
 <94d6a56174c56ef13c9794186fdbfcc12c376c00.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <1ce4502a-d75a-7e27-5844-f195607c4c99@gmail.com>
Date: Fri, 18 Dec 2020 01:05:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <94d6a56174c56ef13c9794186fdbfcc12c376c00.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

T24gMTcvMTIvMjAgMTA6MzMgcG0sIEpvZSBQZXJjaGVzIHdyb3RlOgo+IE9uIFRodSwgMjAyMC0x
Mi0xNyBhdCAxOToxMiArMDUzMCwgQWRpdHlhIFNyaXZhc3RhdmEgd3JvdGU6Cj4+IEN1cnJlbnRs
eSBjaGVja3BhdGNoIHdhcm5zIGZvciBsb25nIGxpbmUgaW4gY29tbWl0IG1lc3NhZ2VzIGV2ZW4g
Zm9yCj4+IFVSTCBsaW5lcy4KPj4KPj4gQW4gZXZhbHVhdGlvbiBvdmVyIHY0LjEzLi52NS44IHNo
b3dlZCB0aGF0IG91dCBvZiB+MTEwMDAgd2FybmluZ3MgZm9yCj4+IHRoaXMgY2xhc3MsIGFyb3Vu
ZCA3OTAgYXJlIGR1ZSB0byB0aGUgbGluZSBjb250YWluaW5nIGxpbmsuCj4+Cj4+IEUuZy4gcnVu
bmluZyBjaGVja3BhdGNoIG9uIGNvbW1pdCAzY2RlODE4Y2QwMmIgKCJBU29DOiB0b3BvbG9neToK
Pj4gQ29uc29saWRhdGUgaG93IGR0ZXh0cyBhbmQgZHZhbHVlcyBhcmUgZnJlZWQiKSByZXBvcnRz
IHRoaXMgd2FybmluZzoKPj4KPj4gV0FSTklORzogUG9zc2libGUgdW53cmFwcGVkIGNvbW1pdCBk
ZXNjcmlwdGlvbiAocHJlZmVyIGEgbWF4aW11bSA3NSBjaGFycyBwZXIgbGluZSkKPj4gaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOS1KYW51
YXJ5LzE0NDc2MS5odG1sCj4+Cj4+IEF2b2lkIGdpdmluZyB1c2VycyB3YXJuaW5nIGZvciBjaGFy
YWN0ZXIgbGltaXQsIGluc3RlYWQgc3VnZ2VzdCB0aGVtIHRvCj4+IHByZWZpeCB0aGUgVVJMcyB3
aXRoICJMaW5rOiIKPj4KPj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIFNyaXZhc3RhdmEgPHlhc2hz
cmk0MjFAZ21haWwuY29tPgo+PiAtLS0KPj4gwqBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgfCAxMCAr
KysrKysrKy0tCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBiL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbAo+IFtdCj4+IEBAIC0zMDMyLDggKzMwMzIsMTQgQEAgc3ViIHByb2Nlc3Mg
ewo+PiDCoAkJICAgICAgJGxpbmUgPX4gL15ccyooPzpGaXhlczp8TGluazp8JHNpZ25hdHVyZV90
YWdzKS9pIHx8Cj4+IMKgCQkJCQkjIEEgRml4ZXM6IG9yIExpbms6IGxpbmUgb3Igc2lnbmF0dXJl
IHRhZyBsaW5lCj4+IMKgCQkgICAgICAkY29tbWl0X2xvZ19wb3NzaWJsZV9zdGFja19kdW1wKSkg
ewo+PiAtCQkJV0FSTigiQ09NTUlUX0xPR19MT05HX0xJTkUiLAo+PiAtCQkJICAgICAiUG9zc2li
bGUgdW53cmFwcGVkIGNvbW1pdCBkZXNjcmlwdGlvbiAocHJlZmVyIGEgbWF4aW11bSA3NSBjaGFy
cyBwZXIgbGluZSlcbiIgLiAkaGVyZWN1cnIpOwo+PiArCQkJaWYgKCRsaW5lID1+IC8oPzpodHRw
fGh0dHBzfGZ0cCk6XC9cLy8pIHsKPj4gKwkJCQlXQVJOKCJDT01NSVRfTE9HX0xPTkdfTElORSIs
Cj4+ICsJCQkJICAgICAiQ29uc2lkZXIgcHJlZml4aW5nIHRoZSBVUkwgd2l0aCAnTGluazonXG4i
IC4gJGhlcmVjdXJyKTsKPj4gKwkJCX0KPj4gKwkJCWVsc2Ugewo+PiArCQkJCVdBUk4oIkNPTU1J
VF9MT0dfTE9OR19MSU5FIiwKPj4gKwkJCQkgICAgICJQb3NzaWJsZSB1bndyYXBwZWQgY29tbWl0
IGRlc2NyaXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBlciBsaW5lKVxuIiAuICRo
ZXJlY3Vycik7Cj4+ICsJCQl9Cj4gCj4gTkFLLgo+IAo+IEFkaXR5YSwgeW91J3ZlIHN1Ym1pdHRl
ZCBzZXZlcmFsIHBhdGNoZXMgdG8gY2hlY2twYXRjaCBhbmQKPiB5b3Ugc2hvdWxkIGtub3cgYmV0
dGVyIGJ5IG5vdyB3aGF0IGNvZGluZyBzdHlsZSBpcyBuZWNlc3NhcnkKPiBmb3IgYWNjZXB0YW5j
ZS4KPiAKPiAJCQl9IGVsc2Ugewo+IAoKU29ycnksIEkgbWlzc2VkIGl0LiBXaWxsIGNoYW5nZSBp
dCA6KQoKPiBNYWtlIHRoZSBVUkkvVVJMIGNoZWNrIGZvbGxvdyB0aGUgc3R5bGVzIGFsbG93ZWQg
YnkgUkZDIDM5ODYuCj4gTG9vayBhdCB0aGUgbG9uZ19saW5lIGNoZWNrIGFyb3VuZCBsaW5lIDM1
MDAgaW50cm9kdWNlZCBieQo+IGNvbW1pdCAyZTRiYmJjNTUwYmUzMzZjYmIzZGVmYzY3NDMwZmMw
NzAwYWExNDI2Cj4gQXV0aG9yOiBBbmRyZWFzIEJyYXVjaGxpIDxhLmJyYXVjaGxpQGVsZW1lbnRh
cmVhLm5ldD4KPiBEYXRlOiAgIFR1ZSBGZWIgNiAxNTozODo0NSAyMDE4IC0wODAwCj4gY2hlY2tw
YXRjaDogYWxsb3cgbG9uZyBsaW5lcyBjb250YWluaW5nIFVSTAo+IAo+IEFsc28gbGlrZWx5IHRo
ZSBVUkkgc2hvdWxkIG5vdCBiZSBhbGxvd2VkIHRvIGV4Y2VlZCB0aGUgbGluZQo+IG1heGltdW0g
dW5sZXNzIGl0J3MgdGhlIGZpcnN0IG5vbi13aGl0ZXNwYWNlIG9mIHRoZSBsaW5lIGFuZAo+IG5v
dCBzdGFydGluZyBhZnRlciBzb21lIG90aGVyIHdvcmQgaW4gdGhlIGxpbmUuCj4gCj4gTGFzdGx5
LCB0aGlzIHNldHMgJGNvbW1pdF9sb2dfbG9uZ19saW5lIGV2ZW4gZm9yIGxpbmVzIHRoYXQKPiBh
cmUgbm93IG5vbWluYWxseSBleGVtcHRlZCBmcm9tIHRoZSBsb25nIGxpbmUgY2hlY2suCj4gCgpP
a2F5LiBJJ2xsIG1ha2UgdGhlc2UgY2hhbmdlcyBhbmQgc2VuZCB0aGUgbW9kaWZpZWQgcGF0Y2gu
Cgo+IFRoZSBudW1iZXIgb2Ygbm9taW5hbCBmaXhlcyB5b3Ugc2hvd2VkIGFib3ZlIGlzIG5vdCBj
b3JyZWN0Lgo+IAo+IFJldHJvc3BlY3RpdmUgdGVzdGluZyBvZiBjaGVja3BhdGNoIHVzaW5nIC0t
Z2l0IGhpc3RvcnkKPiBzaG91bGQgYmUgYXdhcmUgb2YgY2hhbmdlcyB0byBjaGVja3BhdGNoLgo+
IAo+IFRoaXMgc2hvdWxkIGNvdW50IG9ubHkgbGluZXMgZnJvbSA3NSB0byA4MCBjaGFycyBmb3Ig
dGhlCj4gY29tbWl0IHJhbmdlIHlvdSB0ZXN0ZWQgYW5kIG9ubHkgZm9yIDc1IHRvIDEwMCBmb3Ig
Y29tbWl0cwo+IGFmdGVyIGNoZWNrcGF0Y2ggY2hhbmdlZCBpdHMgYWxsb3dlZCBsb25nIGxpbmUg
bWF4aW11bSBpbgo+IGNvbW1pdCBiZGM0OGZhMTFlNDZmODY3ZWE0ZDc1ZmE1OWVlODdhN2Y0OGJl
MTQ0Cj4gY2hlY2twYXRjaC9jb2Rpbmctc3R5bGU6IGRlcHJlY2F0ZSA4MC1jb2x1bW4gd2Fybmlu
Zwo+IAoKSm9lLCBJIHRoaW5rIHRoaXMgaXMgcHJvYmFibHkgdHJ1ZSBvbmx5IGZvciAiV0FSTklO
RzpMT05HX0xJTkUiLgpIb3dldmVyLCBoZXJlIEkgaGF2ZSBhbmFseXplZCB0aGUgY291bnQgZm9y
CiJXQVJOSU5HOkNPTU1JVF9MT0dfTE9OR19MSU5FIi4KCkkgcmFuIGdpdCBsb2cgb24gdGhlc2Ug
bGluZXMuIFByb2JhYmx5IHRoZXNlIGxpbmVzIHdlcmUgbGFzdCBjaGFuZ2VkCmF0IDJhMDc2ZjQw
ZDhjOWJlOTViZWU3YmNmMTg0MzY2NTVlMTE0MDQ0N2YuCgpJIHRoaW5rIEkgY2FuIGNoYW5nZSB0
aGUgY291bnQgd2l0aCBleGFjdCBudW1iZXJzLgoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MK
QWRpdHlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0
cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
