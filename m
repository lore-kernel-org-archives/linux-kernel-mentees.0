Return-Path: <SRS0=Pnpg=JN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6065EC43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Apr 2021 23:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D81E5610CC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Apr 2021 23:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D81E5610CC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823DB41894;
	Fri, 16 Apr 2021 23:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3d5vgiQx862h; Fri, 16 Apr 2021 23:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BCBF41888;
	Fri, 16 Apr 2021 23:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24134C000B;
	Fri, 16 Apr 2021 23:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A49AC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 23:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D29E41888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 23:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lljhIMKsyENO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 23:03:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 778D541870
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 23:03:07 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id s16so23971704iog.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Apr 2021 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mh7KPhLlx4lKOuec3qu70zVXkFr1yF2gQQ0PQcauUIE=;
 b=UJFGZGUgrqrrouEiWcHMIoZhuhTGc+Ot0YkymlGxKSqKbjNjVbjm4SiG6aWsMaJpta
 GTKzjQdXOagv58okSyt2i6YIPbt23iXeJ0uoDafPSYycAhNuVGEnfN5GPTc22QWZ78w9
 /It3/bnDylnpJbRnLQV+OegtKBc+ea1J2KEAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mh7KPhLlx4lKOuec3qu70zVXkFr1yF2gQQ0PQcauUIE=;
 b=UY0E6JvgeuwRvK01po+tG/oQTFATq3bjruBSL7l2wGr8GkbqUAAxjcIsqEW3XyfABS
 xxOLYcxOLiiJCI98xvz8WrYWsFJDkrqOH2nJWHJ4kIZwaD/7sqxGa5ujsMrvdbciREaP
 f5Xbst4zCG8f4iFeg8RGwVZNNmVd5Wf0XnB7mvXadkxPvk6Zw8wTl9Qm/OHTubazbDj2
 ad+0qjigVxrbXysNPszdklljlwP3w4dO5Wnyqo3jpn43VyexNO5Evr5UaxCweQh3TTq2
 cMYnqXIHMdU/vIk8w91DQoQIrage7bqQ2/Q+6SVjVlnjPQdRn/GP8Nf1U6uQ5TWKbyq9
 t/mA==
X-Gm-Message-State: AOAM531on9oMdhYu6Ul7bvbcxDEmbKgkSQSdSMJ4LrVyecqmPVXrzXwa
 Wc/HgySXCRci6QgUyLpfqEAA364Y
X-Google-Smtp-Source: ABdhPJwzleM/3omurgCNaMjlaQDqHjAgQEP4qcU921wdzrTgDfEcZSteDh7nbh3eY3EvlxqnlaFkDQ==
X-Received: by 2002:a02:9389:: with SMTP id z9mr6127773jah.60.1618614186189;
 Fri, 16 Apr 2021 16:03:06 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id f8sm3417150ilr.20.2021.04.16.16.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 16:03:05 -0700 (PDT)
Subject: Re: [PATCH RFC v3] media: em28xx: Fix race condition between open and
 init function
To: Igor Torrente <igormtorrente@gmail.com>, mchehab@kernel.org
References: <20210415140724.15398-1-igormtorrente@gmail.com>
 <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
 <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <49c44747-1f25-11a1-1132-abfe406955b2@linuxfoundation.org>
Date: Fri, 16 Apr 2021 17:03:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c18180b5-52b9-e787-654c-6967ecb81dce@gmail.com>
Content-Language: en-US
Cc: kernel test robot <lkp@intel.com>,
 syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
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

T24gNC8xNi8yMSAxOjMzIFBNLCBJZ29yIFRvcnJlbnRlIHdyb3RlOgo+IAo+IAo+IE9uIDQvMTUv
MjEgMjoyNSBQTSwgU2h1YWggS2hhbiB3cm90ZToKPj4gT24gNC8xNS8yMSA4OjA3IEFNLCBJZ29y
IE1hdGhldXMgQW5kcmFkZSBUb3JyZW50ZSB3cm90ZToKPj4+IEZpeGVzIGEgcmFjZSBjb25kaXRp
b24gLSBmb3IgbGFjayBvZiBhIG1vcmUgcHJlY2lzZSB0ZXJtIC0gYmV0d2Vlbgo+Pj4gZW0yOHh4
X3Y0bDJfb3BlbiBhbmQgZW0yOHh4X3Y0bDJfaW5pdCwgYnkgZGV0YWNoaW5nIHRoZSB2NGwyX2Rl
diwKPj4+IG1lZGlhX3BhZCBhbmQgdmRldiBzdHJ1Y3RzIGZyb20gdGhlIGVtMjh4eF92NGwyLCBh
bmQgbWFuYWdpbmcgdGhlCj4+PiBsaWZldGltZSBvZiB0aG9zZSBvYmplY3RzIG1vcmUgZHluYW1p
Y2FseS4KPj4+Cj4+PiBUaGUgcmFjZSBoYXBwZW5zIHdoZW4gYSB0aHJlYWRbMV0gLSBjb250YWlu
aW5nIHRoZSBlbTI4eHhfdjRsMl9pbml0KCkKPj4+IGNvZGUgLSBjYWxscyB0aGUgdjRsMl9tY19j
cmVhdGVfbWVkaWFfZ3JhcGgoKSwgYW5kIGl0IHJldHVybiBhIGVycm9yLAo+Pj4gaWYgYSB0aHJl
YWRbMl0gLSBydW5uaW5nIHY0bDJfb3BlbigpIC0gcGFzcyB0aGUgdmVyaWZpY2F0aW9uIHBvaW50
Cj4+PiBhbmQgcmVhY2hlcyB0aGUgZW0yOHh4X3Y0bDJfb3BlbigpIGJlZm9yZSB0aGUgdGhyZWFk
WzFdIGZpbmlzaGVzCj4+PiB0aGUgZGVyZWdpc3RyYXRpb24gb2YgdjRsMiBzdWJzeXN0ZW0sIHRo
ZSB0aHJlYWRbMV0gd2lsbCBmcmVlIGFsbAo+Pj4gcmVzb3VyY2VzIGJlZm9yZSB0aGUgZW0yOHh4
X3Y0bDJfb3BlbigpIGNhbiBwcm9jZXNzIHRoZWlyIHRoaW5ncywKPj4+IGJlY2F1c2UgdGhlIGVt
Mjh4eF92NGwyX2luaXQoKSBoYXMgdGhlIGRldi0+bG9jay4gQW5kIGFsbCB0aGlzIGxlYWQKPj4+
IHRoZSB0aHJlYWRbMl0gdG8gY2F1c2UgYSB1c2VyLWFmdGVyLWZyZWUuCj4+Pgo+Pj4gUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Pj4gUmVwb3J0ZWQtYW5k
LXRlc3RlZC1ieTogCj4+PiBzeXpib3QrYjIzOTE4OTU1MTRlZDllZjRhOGVAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQo+Pj4gU2lnbmVkLW9mZi1ieTogSWdvciBNYXRoZXVzIEFuZHJhZGUgVG9y
cmVudGUgPGlnb3JtdG9ycmVudGVAZ21haWwuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gVjI6IEFkZCB2
NGwyX2kyY19uZXdfc3ViZGV2IG51bGwgY2hlY2sKPj4+IMKgwqDCoMKgIERlYWwgd2l0aCB2NGwy
IHN1YmRldnMgZGVwZW5kZW5jaWVzCj4+Pgo+Pj4gVjM6IEZpeCBsaW5rIGVycm9yIHdoZW4gY29t
cGlsZWQgYXMgYSBtb2R1bGUKPj4+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvbWVkaWEvdXNiL2Vt
Mjh4eC9lbTI4eHgtY2FtZXJhLmMgfMKgwqAgNCArLQo+Pj4gwqAgZHJpdmVycy9tZWRpYS91c2Iv
ZW0yOHh4L2VtMjh4eC12aWRlby5jwqAgfCAzMDAgKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+
IMKgIGRyaXZlcnMvbWVkaWEvdXNiL2VtMjh4eC9lbTI4eHguaMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDYgKy0KPj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjA5IGluc2VydGlvbnMoKyksIDEwMSBkZWxl
dGlvbnMoLSkKPj4+Cj4+Cj4+IFRoZSBjaGFuZ2VzIGxvb2tzIGdvb2QgdG8gbWUuIEhhdmUgeW91
IHRyaWVkIGJ1aWxkaW5nIGFzIGEgbW9kdWxlcyBhbmQKPj4gcnVubmluZyBtb2Rwcm9iZXMgYW5k
IHJtbW9kcz8gWW91IGNhbiBkbyB0aGF0IHdpdGhvdXQgYSBkZXZpY2UuCj4+Cj4gCj4gSSB0cmll
ZCBhbmQgZXZlcnl0aGluZyB3b3JrZWQgZmluZS4KPiAKClRoYW5rIHlvdS4KClJldmlld2VkLWJ5
OiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPgoKdGhhbmtzLAotLSBTaHVh
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
a2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
