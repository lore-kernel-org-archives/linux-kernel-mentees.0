Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F9C77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 09:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D433D400B1;
	Wed, 10 May 2023 09:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D433D400B1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aGm4T2Im
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdzL1Wncyakr; Wed, 10 May 2023 09:18:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 800684089A;
	Wed, 10 May 2023 09:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 800684089A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56594C0037;
	Wed, 10 May 2023 09:18:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2716C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 09:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8FD7611EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 09:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FD7611EB
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aGm4T2Im
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFQNNXDq6xEm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 09:18:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A6F60B74
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9A6F60B74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 09:18:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50c079eb705so1795826a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683710282; x=1686302282;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jevaS7XjYmubGxCabqB2SEiMi0tGSHztXxg0wz/p34=;
 b=aGm4T2ImeDl3HjLxeWJMDW3qjdYp5oX4KjuQT3omAd9HqwymdXoVAOkA/zlJqo2y9r
 a+g/FhkDKXE/hrqKlThAQjXEnj79UA3u4n683UNYF2ARpjRlNeteot0WZJj1d1xM1NnU
 e+8Gf/afKFiLPxcsyi4hOwFx0S6xU800dzIeUAqAajU8TKHcgh9IBXtbJS+1liinjO74
 qQ7Cz2z8BNIKGXe1Zjnxmk2GIkXCx79JrJDhv20qtDvHL99Nzk3hqhoEocTodcLYnkTb
 hdVa7ciWOLHHHOBQXWHW04532l2RiFsHLh5+QGmrBsOta3BpFm8p1/i/eZpimV2Ha3m5
 BkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683710282; x=1686302282;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jevaS7XjYmubGxCabqB2SEiMi0tGSHztXxg0wz/p34=;
 b=R/QSUbQwrAe03YX9F2HMN6DRvq26LqQ43XV8YY7QBOyBuJQ/6XwbQGXwGlH5H/M9Ss
 P8WfDKzICP/kk5a510AI9fJN9AhKu21CLlOLuZ9uM/7An1plSZA0+da1dXCVOBKi8ts5
 ufHrOljC7rhYLMFb9Nva/SXAUYtADz/NQSsU3K83n0MpCkK3WjJjuT14wqqLxTCDprmr
 hGXQikJx8kAHZHKjptJ+R3psojwg/3zlBEnMY2d1R+hqQr+ELdKhKslT1XsEHGiV1eTv
 IY+EYtLH/lutnk7TC2LbHS/RBUind/pv7ZRdqXFVSggJ58AHeAOTvZ/zwasLqkbqaWTI
 mV8Q==
X-Gm-Message-State: AC+VfDx1byk5hS8i5D6eagShsSfK6nB5zVIf0hvKNm4NDSL1tGOFM8Hj
 EZspAxYRqh1sS6ZsA87+sf0=
X-Google-Smtp-Source: ACHHUZ6kfTMCVyOH550c2jp3dI6n6OyH0zYXAmIdy28wl6JY97gMQHsMTiRNxw/4pjrcSq6Coyc+fg==
X-Received: by 2002:a05:6402:3482:b0:506:97f2:1a44 with SMTP id
 v2-20020a056402348200b0050697f21a44mr15235342edc.3.1683710282395; 
 Wed, 10 May 2023 02:18:02 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7db8f000000b0050bc863d32asm1669580edt.27.2023.05.10.02.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:18:02 -0700 (PDT)
Message-ID: <414e52c8-d1b8-e445-c896-0f19effc6708@gmail.com>
Date: Wed, 10 May 2023 13:17:59 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 axboe@kernel.dk, 42.hyeyoo@gmail.com, surenb@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
 <87a5yc626f.wl-tiwai@suse.de> <ZFtT9J0DQI9uSd1x@ugly>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <ZFtT9J0DQI9uSd1x@ugly>
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

T24gMTAuMDUuMjAyMyAxMjoyMSwgT3N3YWxkIEJ1ZGRlbmhhZ2VuIHdyb3RlOgo+IE9uIFdlZCwg
TWF5IDEwLCAyMDIzIGF0IDEwOjA2OjE2QU0gKzAyMDAsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4g
QWxzbywgaWYgaXQncyBvbmx5IGFib3V0IHdoaXRlIHNwYWNlIGZpeCBvciBzb21lIGluZGVudCBs
ZXZlbCBpc3N1ZXMsCj4+IHRoYXQgY291bGQgYmUgcmF0aGVyIG1vcmUgbm9pc2UgYW5kIGRpc3R1
cmJzIHRoZSBnaXQgY2hhbmdlIGhpc3RvcnksCj4+IGUuZy4gaXQgbWFrZXMgZGlmZmljdWx0IHRv
IGZpbmQgb3V0IHRoZSByZWFsIGNvZGUgY2hhbmdlcyB2aWEgZ2l0Cj4+IGJsYW1lLCBlc3BlY2lh
bGx5IGl0IHRvdWNoZXMgYSBodWdlIGFtb3VudCBvZiBsaW5lcyBsaWtlIHRoaXMuCj4+Cj4+IFRo
YXQgc2FpZCwgSSdtIG5vdCBnb2luZyB0byB0YWtlIHN1Y2ggImNvZGluZyBzdHlsZSBjbGVhbnVw
IiBwYXRjaAo+PiBibGluZGx5LsKgIElmIGl0J3MgYXNzb2NpYXRlZCB3aXRoIG90aGVyIHJlYWwg
Zml4IG9yIGVuaGFuY2VtZW50LCBJJ2xsCj4+IGhhcHBpbHkgdGFrZSBpdC7CoCBPdGhlcndpc2Us
IEknZCByYXRoZXIgbGVhdmUgaXQuCj4+Cj4gYSBtYXliZSBsZXNzIGNvbmZ1c2luZyB3YXkgdG8g
cHV0IGl0IHdvdWxkIGJlICJkbyB3aGl0ZXNwYWNlIGNsZWFudXBzIAo+IG9ubHkgb24gdGhlIGxp
bmVzIHRoYXQgY29udGFpbiAicmVhbCIgY2hhbmdlcywgYW5kIG1heWJlIGluIHRoZWlyIAo+IGlt
bWVkaWF0ZSBwcm94aW1pdHkgZm9yIGNvbnNpc3RlbmN5Ii4gdGhhdCBtZWFucyB0aGF0IHdoaXRl
c3BhY2Utb25seSAKPiBwYXRjaGVzIGFyZSBieSBkZWZpbml0aW9uIG5vdCBhY2NlcHRhYmxlLgo+
IAo+IHJlZ2FyZHMKCk9zd2FsZCwgVGFrYXNoaSwgdGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRp
b24hIEkgZ290IGl0LiBUaGUgYWNjZXB0YW5jZSAKb2YgY29kZXN0eWxlIGNsZWFudXAgcGF0Y2hl
cyB2YXJ5IGZyb20gb25lIEtlcm5lbCBhcmVhIHRvIGFub3RoZXIuIEknbSAKY3VyaW91cyBhYm91
dCB0aGUgc291bmQgc3Vic3lzdGVtLCBhbmQgZGVjaWRlZCB0byBmaXggc29tZSBvYnZpb3VzIAp0
aGluZ3MgYmVmb3JlIGdvaW5nIHRvIG1vcmUgc2lnbmlmaWNhbnQgZW5oYW5jZW1lbnRzIEkgcHJv
YmFibHkgd291bGQgCmFibGUgdG8gbWFrZS4KCktpbmQgcmVnYXJkcywKSXZhbiBPcmxvdi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVs
LW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
