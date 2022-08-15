Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22203C25B0D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 08:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E975409C1;
	Mon, 15 Aug 2022 08:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E975409C1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DlyKSGRe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nt0jJx-RDk6v; Mon, 15 Aug 2022 08:18:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 123E8409A6;
	Mon, 15 Aug 2022 08:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 123E8409A6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E65DBC0032;
	Mon, 15 Aug 2022 08:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87B02C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5506360ACF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5506360ACF
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=DlyKSGRe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzDw_V0SFUuv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:18:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776EC60625
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 776EC60625
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660551519; x=1692087519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0F0ny3POo01TN8PrWXSpbHLH0QJ4GeZOsaTCgDcIiKw=;
 b=DlyKSGRe4ZEkXDi/iEl2imdy/EmSb2sPnoUfSDZdGqIsCa+TSY3/Vuwa
 yJUWuqgILy5qu98koz/jYBmlghhcPeotbH4NJHW8aUTtwAhMNpaSsH66P
 GVYipqxnmcnekDxTvFRRrbGw4G0VehMNu6+R+v25OeqF176j9OvM60YsC
 6XN0RlWifS6uPJ/7SXQyhPNdvgvaFkggcnf+hyGcJroJCaLRdkTJeD5E6
 vW+Z138Br92IuErkfsSFI9Cl/L0ppw0z/CwmHlv3dKraQ+t8yY6A8lIHP
 iz91/TwcBEtXaXQQkO5IgzjmHzVg5qzgrYDfZzEqqP04Ly/d2rjcJr/uL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="290669541"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="290669541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:18:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="674766312"
Received: from szujuchn-mobl1.gar.corp.intel.com (HELO [10.252.50.152])
 ([10.252.50.152])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:18:34 -0700
Message-ID: <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
Date: Mon, 15 Aug 2022 10:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Khalid Masum <khalid.masum.92@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
 <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CgpPbiA4LzE1LzIyIDA2OjI4LCBLaGFsaWQgTWFzdW0gd3JvdGU6Cj4gT24gOC8xNS8yMiAwMDo0
NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+PiBPbiBTdW4sIEF1ZyAxNCwgMjAyMiBhdCAxMToz
MSBBTSBLaGFsaWQgTWFzdW0KPj4gPGtoYWxpZC5tYXN1bS45MkBnbWFpbC5jb20+IHdyb3RlOgo+
Pj4KPj4+IEFjY29yZGluZyB0byB0aGUgVE9ETywgSW4gc3dfYnVzX21hc3Rlcl9hZGQsIGJ1cy0+
bXVsdGlfbGluayBpcyB0byBiZQo+Pj4gcG9wdWxhdGVkIHdpdGggcHJvcGVydGllcyBmcm9tIEZX
IG5vZGUgcHJvcHMuIE1ha2UgdGhpcyBoYXBwZW4gYnkKPj4+IGNyZWF0aW5nIGEgbmV3IGZ3bm9k
ZV9oYW5kbGUgZmxhZyBGV05PREVfRkxBR19NVUxUSV9MSU5LRUQgYW5kIHVzZQo+Pj4gdGhlIGZs
YWcgdG8gc3RvcmUgdGhlIG11bHRpX2xpbmsgdmFsdWUgZnJvbSBpbnRlbF9saW5rX3N0YXJ0dXAu
IFVzZQo+Pj4gdGhpcyBmbGFnIHRvIGluaXRpYWxpemUgYnVzLT5tdWx0aV9saW5rLgo+Pgo+PiAu
Li4KPj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIElu
aXRpYWxpemUgbXVsdGlfbGluayBmbGFnCj4+PiAtwqDCoMKgwqDCoMKgwqAgKiBUT0RPOiBwb3B1
bGF0ZSB0aGlzIGZsYWcgYnkgcmVhZGluZyBwcm9wZXJ0eSBmcm9tIEZXIG5vZGUKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+Pj4gLcKgwqDCoMKgwqDCoCBidXMtPm11bHRpX2xpbmsgPSBmYWxz
ZTsKPj4+ICvCoMKgwqDCoMKgwqAgYnVzLT5tdWx0aV9saW5rID0gKGZ3bm9kZS0+ZmxhZ3MgJiBG
V05PREVfRkxBR19NVUxUSV9MSU5LRUQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA9PSBGV05PREVfRkxBR19NVUxUSV9MSU5LRUQ7Cj4+Cj4+IE5BSyAoYXMgZmFyIGFzIEkgdW5k
ZXJzdG9vZCB0aGUgY29udGV4dCBvZiB0aGUgY29tbWVudCBhbmQgdGhlIGNoYW5nZQo+PiBpdHNl
bGYpLgo+Pgo+PiBUaGVzZSBmbGFncyBhcmUgZm9yIGRldmxpbmssIHdlIGRvIG5vdCBtaXggRlcg
cHJvcGVydGllcyB3aXRoIHRob3NlCj4+IGludGVybmFsIGZsYWdzIGFueWhvdy4gVGhlIGNvbW1l
bnQgc3VnZ2VzdHMgdGhhdCB0aGlzIHNob3VsZCBiZSBhego+PiBwcm9wZXJ0eS4gQWxzbyBjb21t
aXQgbWVzc2FnZSBkb2Vzbid0IGV4cGxhaW4gdGhlIHJlbGF0aW9uIHRvIGRldmxpbmsuCj4+Cj4g
VGhhdCBpcyBhIGdvb2QgaW5mb3JtYXRpb24gdG8ga25vdy4gVGhhbmtzLgo+IAo+IEkgc2hhbGwg
dHJ5IHRvIGZpbmQgb3V0IGlmIEkgY2FuIHNvbWVob3cgZ2V0IG11bHRpX2xpbmsncyB2YWx1ZSBm
cm9tCj4gZndub2RlIGluIGFueSBvdGhlciB3YXkgYW5kIGxvb2sgaW50byBkZXZsaW5rIGluIHRo
ZSBwcm9jZXNzLgo+IAo+IElmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyByZWdhcmRpbmcgdGhp
cyBUT0RPLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGUgc3VnZ2VzdGlvbiBpcyB0byByZW1vdmUg
dGhlIFRPRE8gYW5kIGxlYXZlIHRoZSBjb2RlIGFzIGlzOiB0aGUKY2FwYWJpbGl0aWVzIGVuYWJs
ZWQgZm9yIG11bHRpLWxpbmsgYXJlIHJlcXVpcmVkIGFzIHBhcnQgb2YgdGhlCnByb2dyYW1taW5n
IHNlcXVlbmNlcywgZXZlbiB3aGVuIGEgc3RyZWFtIHVzZXMgYSBzaW5nbGUgbGluayB3ZSBzdGls
bAp1c2UgdGhlIHN5bmNBcm0vc3luY0dvIHNlcXVlbmNlcy4KClBsZWFzZSBkb24ndCBjaGFuZ2Ug
dGhpcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
