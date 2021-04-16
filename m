Return-Path: <SRS0=Pnpg=JN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBDBC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Apr 2021 19:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161B56137D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Apr 2021 19:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161B56137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9D9540E94;
	Fri, 16 Apr 2021 19:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQBXABhmoVQW; Fri, 16 Apr 2021 19:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49D9C40E92;
	Fri, 16 Apr 2021 19:34:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BC25C000C;
	Fri, 16 Apr 2021 19:34:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 940CCC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 19:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81FA940419
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 19:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hc6l3h3MYjcp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 19:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5A97403D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 19:34:03 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id c6so21623703qtc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ETyLeWgC4ldlxgX9gOjNJ7AnWjdh0/ZzmImW1zL5RMI=;
 b=CX2G+YIGIh2yuN8MjkbHjYrLpXn5LJpkHcuCoR5kK8ziPenqrpnPBohfBcbZJV0Y4E
 gbp2BmAjvMQtVcE5Ndki1O6haSyon6RHZ9TuavMRYtLWd8uT73TIa16lrSppTDHlEp6y
 nBciopNar97QzrsbisXtZpTSc2wGNJ3+4Fvc9R0tc0kSAN4vrGfMQZgAUZOphV/9H33V
 A6hY80u0x14Ek2ZdV+4RZ/8k5eI8EGK6J4f9qtZQW9EDGVWIMAFaFl2/bSTvrYi09cb2
 FkmL1Zhw/t7jkXsH1czgX6yP5vZ1uJ4j/tilEVuPdCYJYIntPW+nqeL/li0A5NiYWym3
 DWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ETyLeWgC4ldlxgX9gOjNJ7AnWjdh0/ZzmImW1zL5RMI=;
 b=rfNozjFVK2iUeqmEWiObiHUgS6pKj7jYECeO3ZxqFwMcrQldjiTTfW1DKiiU5KevwG
 ZBh4NkwjYCrk3ingtQiZzLFoquiO536Mj5lvD1b7i2Yzm7/WaJuOJwbil9W0LayEAX88
 YeksY7HEnUUu5+tPMw6wkPMmzMFrZRVxopAP9j4UsEzsNg0LhnVkxSbdieLyV2vmdiSm
 ZHuOcicInsd932QHPc5gqKP58aE+bEn/NwKRqvS7eGhs4UVSBfeBX1ruIHShSu6t00Ud
 THUgeB3W/WNXz41HCXdhuDJVuJp7tNiQgFSu097Cl5YOJ/gH9mn7qqaom3fzpMoTUD0L
 m8fA==
X-Gm-Message-State: AOAM5302bxOmeV1n6Us0jqIFYr9XcHR9vTTXVooqPyPnc9tXtQh9IZNt
 kYByIohsCl3jXZQdPJ9+N4Y=
X-Google-Smtp-Source: ABdhPJxk50y+ZCriLsVXKTHn1xmUJk8V3P7VDGQKdrW4uDMW35tXLWJ299pTEwT8ZvdCevie6YDiow==
X-Received: by 2002:a05:622a:46:: with SMTP id y6mr670494qtw.44.1618601642482; 
 Fri, 16 Apr 2021 12:34:02 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b:fbbc:3360:40c4:fb64?
 ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
 by smtp.gmail.com with ESMTPSA id o25sm679073qtl.37.2021.04.16.12.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 12:34:02 -0700 (PDT)
Subject: Re: [PATCH RFC v3] media: em28xx: Fix race condition between open and
 init function
To: Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org
References: <20210415140724.15398-1-igormtorrente@gmail.com>
 <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
From: Igor Torrente <igormtorrente@gmail.com>
Message-ID: <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
Date: Fri, 16 Apr 2021 16:33:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
Content-Language: en-US
Cc: kernel test robot <lkp@intel.com>,
 syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
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

CgpPbiA0LzE1LzIxIDI6MjUgUE0sIFNodWFoIEtoYW4gd3JvdGU6Cj4gT24gNC8xNS8yMSA4OjA3
IEFNLCBJZ29yIE1hdGhldXMgQW5kcmFkZSBUb3JyZW50ZSB3cm90ZToKPj4gRml4ZXMgYSByYWNl
IGNvbmRpdGlvbiAtIGZvciBsYWNrIG9mIGEgbW9yZSBwcmVjaXNlIHRlcm0gLSBiZXR3ZWVuCj4+
IGVtMjh4eF92NGwyX29wZW4gYW5kIGVtMjh4eF92NGwyX2luaXQsIGJ5IGRldGFjaGluZyB0aGUg
djRsMl9kZXYsCj4+IG1lZGlhX3BhZCBhbmQgdmRldiBzdHJ1Y3RzIGZyb20gdGhlIGVtMjh4eF92
NGwyLCBhbmQgbWFuYWdpbmcgdGhlCj4+IGxpZmV0aW1lIG9mIHRob3NlIG9iamVjdHMgbW9yZSBk
eW5hbWljYWx5Lgo+Pgo+PiBUaGUgcmFjZSBoYXBwZW5zIHdoZW4gYSB0aHJlYWRbMV0gLSBjb250
YWluaW5nIHRoZSBlbTI4eHhfdjRsMl9pbml0KCkKPj4gY29kZSAtIGNhbGxzIHRoZSB2NGwyX21j
X2NyZWF0ZV9tZWRpYV9ncmFwaCgpLCBhbmQgaXQgcmV0dXJuIGEgZXJyb3IsCj4+IGlmIGEgdGhy
ZWFkWzJdIC0gcnVubmluZyB2NGwyX29wZW4oKSAtIHBhc3MgdGhlIHZlcmlmaWNhdGlvbiBwb2lu
dAo+PiBhbmQgcmVhY2hlcyB0aGUgZW0yOHh4X3Y0bDJfb3BlbigpIGJlZm9yZSB0aGUgdGhyZWFk
WzFdIGZpbmlzaGVzCj4+IHRoZSBkZXJlZ2lzdHJhdGlvbiBvZiB2NGwyIHN1YnN5c3RlbSwgdGhl
IHRocmVhZFsxXSB3aWxsIGZyZWUgYWxsCj4+IHJlc291cmNlcyBiZWZvcmUgdGhlIGVtMjh4eF92
NGwyX29wZW4oKSBjYW4gcHJvY2VzcyB0aGVpciB0aGluZ3MsCj4+IGJlY2F1c2UgdGhlIGVtMjh4
eF92NGwyX2luaXQoKSBoYXMgdGhlIGRldi0+bG9jay4gQW5kIGFsbCB0aGlzIGxlYWQKPj4gdGhl
IHRocmVhZFsyXSB0byBjYXVzZSBhIHVzZXItYWZ0ZXItZnJlZS4KPj4KPj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBSZXBvcnRlZC1hbmQtdGVzdGVk
LWJ5OiAKPj4gc3l6Ym90K2IyMzkxODk1NTE0ZWQ5ZWY0YThlQHN5emthbGxlci5hcHBzcG90bWFp
bC5jb20KPj4gU2lnbmVkLW9mZi1ieTogSWdvciBNYXRoZXVzIEFuZHJhZGUgVG9ycmVudGUgPGln
b3JtdG9ycmVudGVAZ21haWwuY29tPgo+PiAtLS0KPj4KPj4gVjI6IEFkZCB2NGwyX2kyY19uZXdf
c3ViZGV2IG51bGwgY2hlY2sKPj4gwqDCoMKgwqAgRGVhbCB3aXRoIHY0bDIgc3ViZGV2cyBkZXBl
bmRlbmNpZXMKPj4KPj4gVjM6IEZpeCBsaW5rIGVycm9yIHdoZW4gY29tcGlsZWQgYXMgYSBtb2R1
bGUKPj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbWVkaWEvdXNiL2VtMjh4eC9lbTI4eHgtY2FtZXJh
LmMgfMKgwqAgNCArLQo+PiDCoCBkcml2ZXJzL21lZGlhL3VzYi9lbTI4eHgvZW0yOHh4LXZpZGVv
LmPCoCB8IDMwMCArKysrKysrKysrKysrKystLS0tLS0tLQo+PiDCoCBkcml2ZXJzL21lZGlhL3Vz
Yi9lbTI4eHgvZW0yOHh4LmjCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstCj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgMjA5IGluc2VydGlvbnMoKyksIDEwMSBkZWxldGlvbnMoLSkKPj4KPiAKPiBUaGUg
Y2hhbmdlcyBsb29rcyBnb29kIHRvIG1lLiBIYXZlIHlvdSB0cmllZCBidWlsZGluZyBhcyBhIG1v
ZHVsZXMgYW5kCj4gcnVubmluZyBtb2Rwcm9iZXMgYW5kIHJtbW9kcz8gWW91IGNhbiBkbyB0aGF0
IHdpdGhvdXQgYSBkZXZpY2UuCj4gCgpJIHRyaWVkIGFuZCBldmVyeXRoaW5nIHdvcmtlZCBmaW5l
LgoKPiB0aGFua3MsCj4gLS0gU2h1YWgKPiAKClRoYW5rcywKLS0tCklnb3IgTWF0aGV1cyBBbmRy
YWRlIFRvcnJlbnRlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
