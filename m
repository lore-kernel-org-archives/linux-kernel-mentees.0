Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC476C77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Apr 2023 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29CC183EFF;
	Sun, 16 Apr 2023 13:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29CC183EFF
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTjmU/TH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKCdJISAuwbe; Sun, 16 Apr 2023 13:09:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1716C83C88;
	Sun, 16 Apr 2023 13:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1716C83C88
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6379C0036;
	Sun, 16 Apr 2023 13:09:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B78DBC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A00BF60BF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 13:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A00BF60BF5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTjmU/TH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R141nuhI7zNM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 13:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A6B660B0E
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A6B660B0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681650542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
 b=WTjmU/TH8oTkBAC72iukioomlBJ5W/Cl6IOLMaCRLgQoyPUn+aV8cAT/7JhYzXeBIxRqd0
 Gw44whZS+56vYNJF8CqRKEtWkQTrkA6tSvc9JZxyPvd2/BuN5K7J8xD30ZGs8l30Gcf6GA
 hW/yN9b/MwKPkSvqQjAj0JpmOt06/4s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-VJuukJzNNha4g2Sj6OztDQ-1; Sun, 16 Apr 2023 09:08:59 -0400
X-MC-Unique: VJuukJzNNha4g2Sj6OztDQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d2-20020a50f682000000b0050503f2097aso6985353edn.14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650538; x=1684242538;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
 b=IS/QKYifepYCSh4qqrYBnzqPvpF2LUyfOQ6VLGgcS4iXZKgnR/56cAPpUHHeYdL25K
 wPFZdJMu+v22OzM6G0MmIfz6EIuPUwztBv6V540adNyzSab8d+L1Q0nDB3SkrogeiIvu
 4fWOtTfk1xPYBMhSx2bhi4Taix/9jLkFF8JmhWq102cW1aOYUfBcmUFRkVNB3C0uXpiw
 2dcOm2LiZmBoPyHi4JtpCAo+YqgXMZWDBPofkubDMQjvWa+OuEbB+qfIBVsjdDR3atv4
 hI3g60FoYZfSoHymhRAYhCg2Ab9G0LXEWxWV+yfIIlL6iVdVY5GAefDkyl1BiapzFbQG
 DblQ==
X-Gm-Message-State: AAQBX9dvVugBhCFqJRATzPmGV3qJ/1thE1LDZgJwc5moEvD7KrRVWZzf
 PcRj0ZJHsW9t3uc3z3mlRnAf3jL8/+KGUUVTGT7ZIsnItkMi9biJo0M6ryW4ynNZqVn5iQ89qd9
 sYttdufym5FoWdmXR9YEGUe4UAr7O9Gm6AGHvE0QjxDE42wPu
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id
 f22-20020a170906561600b0094a41073975mr3988007ejq.76.1681650537909; 
 Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8T5yCBh6wbbbBr7heC2qmakzdZtsbI8F4J0aabpm/Yfbud6LdMSwb8q3jPy/KSS4e7PhRhQ==
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id
 f22-20020a170906561600b0094a41073975mr3987989ejq.76.1681650537667; 
 Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a17090613d900b0094edfbd475csm3581864ejc.127.2023.04.16.06.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Message-ID: <1a4a7016-a871-abbe-e8cb-c8a7241de50f@redhat.com>
Date: Sun, 16 Apr 2023 15:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Anup Sharma <anupnewsmail@gmail.com>
References: <ZDuhnLPczec5qJnq@yoga>
 <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Cc: andy@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

SGksCgpPbiA0LzE2LzIzIDEyOjAxLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gU3VuLCBB
cHIgMTYsIDIwMjMgYXQgMTA6MjDigK9BTSBBbnVwIFNoYXJtYSA8YW51cG5ld3NtYWlsQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+IEZpeCBmb2xsb3dpbmcgY2hlY2twYXRjaC5wbCB3YXJuaW5nIGJ5
IGluY2x1ZGluZwo+PiA8bGludXgvcHJvY2Vzc29yLmg+IGluc3RlYWQgb2YgPGFzbS9wcm9jZXNz
b3IuaD4KPiAKPiBNaXNzaW5nIHBlcmlvZCBhdCB0aGUgZW5kLiBCdXQgdGhlIGVudGlyZSBwYXRj
aCBzZWVtcyB1bm5lY2Vzc2FyeQo+IHNpbmNlIGl0J3MgYWxsIGFib3V0IHg4NiwgYW5kIHdlIGhh
dmUgbW9yZSBhcmNoIGhlYWRlcnMgdGhlcmUgYW55d2F5Lgo+IEFueXdheSBpdCdzIHVwIHRvIEhh
bnMuIEFsc28gc2VlIGJlbG93LgoKUmlnaHQsIGdpdmVuIGhvdyBtdWNoIHJlYWwgd29yayB0aGlz
IGRyaXZlciBzdGlsbCBuZWVkcyB0aGlzCnJlYWxseSBmZWVscyBsaWtlIG5lZWRsZXNzIGNodXJu
LCBzbyBJJ20gbm90IGdvaW5nIHRvIHRha2UKdGhpcyBwYXRjaCwgc29ycnkuCgpSZWdhcmRzLAoK
SGFucwoKCgo+IAo+IC4uLgo+IAo+PiAgI2luY2x1ZGUgPGFzbS9pbnRlbC1mYW1pbHkuaD4KPj4g
LSNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcHJvY2Vzc29y
Lmg+Cj4+Cj4+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4+ICAjaW5jbHVkZSA8bWVkaWEvdjRs
Mi1zdWJkZXYuaD4KPiAKPiBUaGlzIHNlZW1zIGEgYml0IGNoYW90aWMgd2l0aCB0aGUgb3JkZXJp
bmcgb2YgdGhlIGhlYWRlcnMgaGVyZS4KPiAKPiAuLi4KPiAKPiBJZiB5b3Ugd2FudCBhIGdvb2Qg
cGF0Y2gsIHlvdSBuZWVkIHRvIHVuZGVyc3RhbmQgd2hhdCBoZWFkZXJzIGFyZQo+IF9yZWFsbHlf
IGJlaW5nIHVzZWQgaW4gdGhlIGhlYWRlciBmaWxlLiBUaGVuIGRyb3AgdW51c2VkLCB0cnkgdG8K
PiBjb21waWxlIHRoYXQgYW5kIGZpeCBhbGwgZmlsZXMgdGhhdCB3aWxsIGhhdmUgbWlzc2luZyBo
ZWFkZXJzIGFmdGVyCj4gdGhhdC4gVGhpcyB3aWxsIGJlIGEgdmVyeSB1c2VmdWwgY2xlYW4gdXAh
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
