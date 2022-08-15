Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F87C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 12:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC50823C6;
	Mon, 15 Aug 2022 12:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC50823C6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lGLY3FpD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usfU_845LvuG; Mon, 15 Aug 2022 12:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8733D81D4F;
	Mon, 15 Aug 2022 12:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8733D81D4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51F66C0032;
	Mon, 15 Aug 2022 12:10:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7C3FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B600341680
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B600341680
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lGLY3FpD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7iJXatYPkf6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:10:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6234D415EB
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6234D415EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:10:53 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id a8so6771396pjg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=w0Mjm1yI3tFxRPUURdrFm5SP6GE+L3QToY/2DXzlvgk=;
 b=lGLY3FpDa9kFxeJRGunbWRcIA04Z1farW0ZsA8fkYWIVVBBg/f86rbsJfSD3ibtX0M
 U3dt1gpti5wKm97ffMpCka3KZBy+ikdjeUGkST3VTMXiF4k540cNl27zZdH/fYK0/d1B
 cuPYbQfwuhy28GZnC+9uAhPZIARXBXPKfTqVbMuSMaCet8U4wyD4mmQta79XcxQsoUXq
 hF7U4RiikpUDxqfnn1npFWQQu9ywiyis3iSuwl+XwcgH/UHnO6HoPEyjxJdI0w+w+CZC
 lyW02uvt+kaJYNdLfa6qROGaANZB5EMRQAPYncThTOMLD/GaYh3TEqYgbRf1I56lnRvt
 PLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=w0Mjm1yI3tFxRPUURdrFm5SP6GE+L3QToY/2DXzlvgk=;
 b=KOkf7NVDtcVJMZDAJPJ8Z1G7hoOEhf8nutVyAMZezmvhoRpFTpxx7Bb4VuuTVNL+Ki
 IiXZZRdBVOkZy6wl+J/QX/k0FhfobHAU6WR92zozwDZzjn1eJSOdZlW++72Wn0KVnVtM
 OFZ/80NROsPU8ai2PtZmzVxjz9Aed52zd3KjawdhRY2gJ6O4BKx6e6EBW2B8G4XwwL7Y
 lFKVv2uxlYEUz87kq1+PJwe2IlgeZgyZ8EC1PPtNKUef9F6jiEBfjBNUR9B92+YlzBSV
 BybNK2O3PTGBNwVx4ER8spi2OQ1IA1xHOnZ5dwbV+HOZY5CKvwHmpb/E61zWfuYGzQmS
 Dgpw==
X-Gm-Message-State: ACgBeo3FD0gWjLFP9mADZ8WhmE6DB2tGisMmPFaqhY27hdFcOSUUQmVc
 maWXLtpXqbaCitQQDPUD6uQ=
X-Google-Smtp-Source: AA6agR4syNM8Z3sSCzQzhZW2WNyv5yIvr0ICRxqdKmutKqGSYqWka1B4xOFbsbHO3K5TcK8hKP8oJw==
X-Received: by 2002:a17:90b:380d:b0:1f5:2c6d:7de8 with SMTP id
 mq13-20020a17090b380d00b001f52c6d7de8mr27495438pjb.18.1660565452735; 
 Mon, 15 Aug 2022 05:10:52 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.152])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b001ef87123615sm4421101pjb.37.2022.08.15.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 05:10:51 -0700 (PDT)
Message-ID: <2f0d50a1-b9d0-577f-d718-459ae0b1ba77@gmail.com>
Date: Mon, 15 Aug 2022 18:10:43 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
 <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
 <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

T24gOC8xNS8yMiAxNDoxNiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4gT24g
OC8xNS8yMiAwNjoyOCwgS2hhbGlkIE1hc3VtIHdyb3RlOgo+PiBPbiA4LzE1LzIyIDAwOjQ2LCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+PiBPbiBTdW4sIEF1ZyAxNCwgMjAyMiBhdCAxMTozMSBB
TSBLaGFsaWQgTWFzdW0KPj4+IDxraGFsaWQubWFzdW0uOTJAZ21haWwuY29tPiB3cm90ZToKPj4+
Pgo+Pj4+IEFjY29yZGluZyB0byB0aGUgVE9ETywgSW4gc3dfYnVzX21hc3Rlcl9hZGQsIGJ1cy0+
bXVsdGlfbGluayBpcyB0byBiZQo+Pj4+IHBvcHVsYXRlZCB3aXRoIHByb3BlcnRpZXMgZnJvbSBG
VyBub2RlIHByb3BzLiBNYWtlIHRoaXMgaGFwcGVuIGJ5Cj4+Pj4gY3JlYXRpbmcgYSBuZXcgZndu
b2RlX2hhbmRsZSBmbGFnIEZXTk9ERV9GTEFHX01VTFRJX0xJTktFRCBhbmQgdXNlCj4+Pj4gdGhl
IGZsYWcgdG8gc3RvcmUgdGhlIG11bHRpX2xpbmsgdmFsdWUgZnJvbSBpbnRlbF9saW5rX3N0YXJ0
dXAuIFVzZQo+Pj4+IHRoaXMgZmxhZyB0byBpbml0aWFsaXplIGJ1cy0+bXVsdGlfbGluay4KPj4+
Cj4+PiAuLi4KPj4+Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgICogSW5pdGlhbGl6ZSBtdWx0aV9saW5rIGZsYWcKPj4+PiAtwqDCoMKgwqDCoMKgwqAg
KiBUT0RPOiBwb3B1bGF0ZSB0aGlzIGZsYWcgYnkgcmVhZGluZyBwcm9wZXJ0eSBmcm9tIEZXIG5v
ZGUKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gLcKgwqDCoMKgwqDCoCBidXMtPm11
bHRpX2xpbmsgPSBmYWxzZTsKPj4+PiArwqDCoMKgwqDCoMKgIGJ1cy0+bXVsdGlfbGluayA9IChm
d25vZGUtPmZsYWdzICYgRldOT0RFX0ZMQUdfTVVMVElfTElOS0VEKQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgID09IEZXTk9ERV9GTEFHX01VTFRJX0xJTktFRDsKPj4+Cj4+PiBO
QUsgKGFzIGZhciBhcyBJIHVuZGVyc3Rvb2QgdGhlIGNvbnRleHQgb2YgdGhlIGNvbW1lbnQgYW5k
IHRoZSBjaGFuZ2UKPj4+IGl0c2VsZikuCj4+Pgo+Pj4gVGhlc2UgZmxhZ3MgYXJlIGZvciBkZXZs
aW5rLCB3ZSBkbyBub3QgbWl4IEZXIHByb3BlcnRpZXMgd2l0aCB0aG9zZQo+Pj4gaW50ZXJuYWwg
ZmxhZ3MgYW55aG93LiBUaGUgY29tbWVudCBzdWdnZXN0cyB0aGF0IHRoaXMgc2hvdWxkIGJlIGF6
Cj4+PiBwcm9wZXJ0eS4gQWxzbyBjb21taXQgbWVzc2FnZSBkb2Vzbid0IGV4cGxhaW4gdGhlIHJl
bGF0aW9uIHRvIGRldmxpbmsuCj4+Pgo+PiBUaGF0IGlzIGEgZ29vZCBpbmZvcm1hdGlvbiB0byBr
bm93LiBUaGFua3MuCj4+Cj4+IEkgc2hhbGwgdHJ5IHRvIGZpbmQgb3V0IGlmIEkgY2FuIHNvbWVo
b3cgZ2V0IG11bHRpX2xpbmsncyB2YWx1ZSBmcm9tCj4+IGZ3bm9kZSBpbiBhbnkgb3RoZXIgd2F5
IGFuZCBsb29rIGludG8gZGV2bGluayBpbiB0aGUgcHJvY2Vzcy4KPj4KPj4gSWYgeW91IGhhdmUg
YW55IHN1Z2dlc3Rpb25zIHJlZ2FyZGluZyB0aGlzIFRPRE8sIHBsZWFzZSBsZXQgbWUga25vdy4K
PiAKPiBUaGUgc3VnZ2VzdGlvbiBpcyB0byByZW1vdmUgdGhlIFRPRE8gYW5kIGxlYXZlIHRoZSBj
b2RlIGFzIGlzOiB0aGUKPiBjYXBhYmlsaXRpZXMgZW5hYmxlZCBmb3IgbXVsdGktbGluayBhcmUg
cmVxdWlyZWQgYXMgcGFydCBvZiB0aGUKPiBwcm9ncmFtbWluZyBzZXF1ZW5jZXMsIGV2ZW4gd2hl
biBhIHN0cmVhbSB1c2VzIGEgc2luZ2xlIGxpbmsgd2Ugc3RpbGwKPiB1c2UgdGhlIHN5bmNBcm0v
c3luY0dvIHNlcXVlbmNlcy4KPiAKPiBQbGVhc2UgZG9uJ3QgY2hhbmdlIHRoaXMuCgpUaGFua3Mg
Zm9yIHRoZSBzdWdnZXN0aW9uISBJIHNoYWxsIHNlbmQgYSBwYXRjaCB3aXRoIHRoZSBUT0RPIHJl
bW92ZWQsIApsZWF2aW5nIHRoZSBjb2RlIGFzIGlzLgoKICAgLS0gS2hhbGlkIE1hc3VtCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
