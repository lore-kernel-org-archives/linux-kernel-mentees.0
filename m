Return-Path: <SRS0=uLYh=6G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AE2C54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 20:45:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70892077D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 20:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCrDk+gB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D70892077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADAE98695F;
	Wed, 22 Apr 2020 20:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PowIpAHyvJgu; Wed, 22 Apr 2020 20:45:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 26673858AE;
	Wed, 22 Apr 2020 20:45:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1107BC1D7D;
	Wed, 22 Apr 2020 20:45:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E71FAC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D903F858AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 20:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dblCRV-wl6b8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 20:45:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 142B985B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 20:45:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x18so4215297wrq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YzHL/XuKYUZWgjReY485nj6JXiTRM3dacPOq/iZpep8=;
 b=JCrDk+gBKaqSqUnlHZyvk/yIKUSygZnOaAYAx2TwW9XkQY1pp5eAR0l12vNGKT924o
 RPALOiYRexH2t3BCNrJp2hf7HiGSWT2fxA6cM6qvibY/j0HLMLwjXkIRkWDVzCxpW7wu
 +wgrEdc4xGsWNOVigjTME/9YitIT9ELPcZX//MIWfTUU7JHOut0Cw3OYzhuw+0sZUQTd
 LgdyFQq2RBs7vLMI7XoWG1QyKgCVBeEnSJmH2YoFDmV2rblC9OH7D9I3fpj/77lWaiq1
 slJq4k2BusQq90y6M0xPPU+HmhselF8fDQMFwTUNQNsoQYk8qDtno1dDUbfpJWNzAHgA
 D8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YzHL/XuKYUZWgjReY485nj6JXiTRM3dacPOq/iZpep8=;
 b=lVEFFB/asjM/S55WqM4ZCylYck+CZlvX9OyjV/wlGExNinsJYpeW+SN5MIQfvaj7+M
 vPkLFbMlrK27SxAOc5gnoMKaBetAkEgIYnVLWnQ73QloLsxoDyAv8vtswrNtUucZGnBs
 aMs1xZxGe4RITVhZ2lF1xwPY7hSYdRQm7BeRZmsUAcoLdG8DwwVhSN7h0mBE7Sqw8DHe
 ewasLMTBYFFNIjNpAsiV+AN9mtedBah0OtYRopq5cX648iJ0xlByFv2Xu7YsUzo1ners
 cIFHwMIDKyR6r8EiZnNDNFxtEojmTUmYRjb8xeiZG8Rl4L713m9BLh/fHdsW1A8gzV9h
 nVLQ==
X-Gm-Message-State: AGi0PuacyqBVcQft98S+dzNm3Pjz+SXE1V/JENTyC+zajv1DigEKmeRY
 Sqz2tXEIpxWgjfULGcqqYfU=
X-Google-Smtp-Source: APiQypLm0dAfI1o0vyZ94MtEGGq7rpmWdArERGpvakNxQcf65u8fSn+i5oSrPA2HfA11BKnWAIOeSA==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr1018325wra.71.1587588319572; 
 Wed, 22 Apr 2020 13:45:19 -0700 (PDT)
Received: from net.saheed (563BD1A4.dsl.pool.telekom.hu. [86.59.209.164])
 by smtp.gmail.com with ESMTPSA id r20sm549241wmh.26.2020.04.22.13.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 13:45:18 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
 <20200420083617.7cdcbd1c@coco.lan>
 <bd14efb7-6144-1e0d-7cff-459f6d1c9a94@gmail.com>
 <20200421124552.6efe8ef7@coco.lan>
 <83e58149-42ea-8067-780d-6569b4dd6a79@gmail.com>
 <20200422210903.6a99a51d@coco.lan>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <be840fef-784b-77d0-41d6-152ed09faba9@gmail.com>
Date: Wed, 22 Apr 2020 21:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422210903.6a99a51d@coco.lan>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Ck9uIDQvMjIvMjAgOTowOSBQTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IEVtIFdl
ZCwgMjIgQXByIDIwMjAgMTk6NTM6NDIgKzAyMDAKPiBTYWhlZWQgQm9sYXJpbndhIDxyZWZhY3Rv
cm15c2VsZkBnbWFpbC5jb20+IGVzY3JldmV1Ogo+Cj4+IFNvcnJ5IGZvciB0YWtpbmcgbG9uZyB0
byByZXBseS4KPj4KPj4gSSB0aGluayBJIGdvdCBkaWZmZXJlbnQgd2FybmluZ3MgYmVjYXVzZSBJ
IHdhcyBjaGVja2luZyBmb3Igd2FybmluZ3Mgb24KPj4gdGhlIHN0YWJsZSB0cmVlLiBJIGdldCBh
IGRpZmZlcmVudCBzZXQgb2YKPj4KPj4gd2FybmluZ3Mgbm93IHdpdGggbGludXgtbmV4dC7CoCBK
dXN0IHRvIGNvbmZpcm0sIGhlcmUgaXMgd2hhdCBJIGFtIGRvaW5nOgo+Pgo+PiAgICAgIC0gdXBk
YXRlIG15IGxvY2FsIHJlcG8gdG8gbGludXgtbWFpbgo+Pgo+PiAgICAgIC0gcnVuIHRoaXMgY29t
bWFuZMKgIG1ha2UgaHRtbGRvY3MgPiBkb2NfbWFrZS5sb2cgMj4mMQo+Pgo+PiAgICAgIC0gY2hl
Y2sgZG9jX21ha2UubG9nIGZvciB3YXJuaW5ncwo+IE5vLCB0aGUgYmVzdCBpcyB0byB1c2UgdGhl
IGxhdGVzdCB0YWcgYXQgbGludXggbmV4dCAod2l0aCBhcmUgdXBkYXRlZAo+IGV2ZXJ5IGRheSku
Cj4KPiBTbywgeW91IHNob3VsZCBkbyBzb21ldGhpbmcgbGlrZToKPgo+IAkjIGluIGNhc2UgeW91
ciB0cmVlIGlzIG5vdCBiYXNlZCBvbiBsaW51eC1uZXh0Ogo+IAkkIGdpdCByZW1vdGUgYWRkIGxp
bnV4LW5leHQgZ2l0Oi8vZ2l0aHViLmNvbS9zZnJvdGh3ZWxsL2xpbnV4LW5leHQuZ2l0Cj4KPgo+
IFRoZW46Cj4KPiAJJCBnaXQgY2hlY2tvdXQgLWIgbXlfZG9jc19uZXh0X2JyYW5jaCBuZXh0LTIw
MjAwNDIyCj4gCSQgbWFrZSBodG1sZG9jcwo+Cj4gVGhhbmtzLAo+IE1hdXJvCgpPa2F5LCBJIGhh
dmUgZG9uZSB0aGF0IGFuZCBJIHNlZSB0aGUgd2FybmluZ3MuIFBsZWFzZSwgZG8geW91IGhhdmUg
YW55IApzdWdnZXN0aW9uIG9uIHdoZXJlIHRvIHN0YXJ0PwoKVGhhbmsgeW91LgoKLSBTYWhlZWQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtl
cm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51
eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
