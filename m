Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF27C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 10:29:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CA472067C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 10:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CA472067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=daenzer.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F2D1870D6;
	Mon,  7 Sep 2020 10:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUlT0PTYtQx0; Mon,  7 Sep 2020 10:29:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC98B8710B;
	Mon,  7 Sep 2020 10:29:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 979E0C0052;
	Mon,  7 Sep 2020 10:29:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8AFFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 10:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D2C4085184
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwOTCB9Z6iHQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 10:29:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 79F4A85168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 10:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0C0B02A6042;
 Mon,  7 Sep 2020 12:29:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qXTjMtX9lbI6; Mon,  7 Sep 2020 12:29:24 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id CE6672A6016;
 Mon,  7 Sep 2020 12:29:23 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kFEOw-000Lc5-KY; Mon, 07 Sep 2020 12:29:22 +0200
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <5ea9e575-e2ba-1f12-4894-3c0d271ea294@daenzer.net>
Date: Mon, 7 Sep 2020 12:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
Content-Language: en-CA
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] video: fbdev: radeonfb:
 PCI PM framework upgrade and fix-ups.
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

T24gMjAyMC0wOS0wNyA5OjU1IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBB
dWcgMDYsIDIwMjAgYXQgMTI6NTI6NTRQTSArMDUzMCwgVmFpYmhhdiBHdXB0YSB3cm90ZToKPj4g
TGludXggS2VybmVsIE1lbnRlZTogUmVtb3ZlIExlZ2FjeSBQb3dlciBNYW5hZ2VtZW50Lgo+Pgo+
PiBUaGUgb3JpZ2luYWwgZ29hbCBvZiB0aGUgcGF0Y2ggc2VyaWVzIGlzIHRvIHVwZ3JhZGUgdGhl
IHBvd2VyIG1hbmFnZW1lbnQKPj4gZnJhbWV3b3JrIG9mIHJhZGVvbmZiIGZiZGV2IGRyaXZlci4g
VGhpcyBoYXMgYmVlbiBkb25lIGJ5IHVwZ3JhZGluZyAuc3VzcGVuZCgpCj4+IGFuZCAucmVzdW1l
KCkgY2FsbGJhY2tzLgo+Pgo+PiBUaGUgdXBncmFkZSBtYWtlcyBzdXJlIHRoYXQgdGhlIGludm9s
dmVtZW50IG9mIFBDSSBDb3JlIGRvZXMgbm90IGNoYW5nZSB0aGUKPj4gb3JkZXIgb2Ygb3BlcmF0
aW9ucyBleGVjdXRlZCBpbiBhIGRyaXZlci4gVGh1cywgZG9lcyBub3QgY2hhbmdlIGl0cyBiZWhh
dmlvci4KPj4KPj4gRHVyaW5nIHRoaXMgcHJvY2VzcywgaXQgd2FzIGZvdW5kIHRoYXQgIiNpZiBk
ZWZpbmVkKENPTkZJR19QTSkiIGF0IGxpbmUgMTQzNCBpcwo+PiByZWR1bmRhbnQuIFRoaXMgd2Fz
IGludHJvZHVjZWQgaW4gdGhlIGNvbW1pdAo+PiA0MmRkYjQ1M2EwY2QgKCJyYWRlb246IENvbmRp
dGlvbmFsbHkgY29tcGlsZSBQTSBjb2RlIikuCj4gCj4gSSBkbyB3b25kZXIgd2hldGhlciBpdCB3
b3VsZG4ndCBiZSBiZXR0ZXIgdG8ganVzdCBvdXRyaWdodCBkZWxldGUgdGhlc2UsCj4gd2UgaGF2
ZSB0aGUgZHJtIHJhZGVvbiBkcml2ZXIgZm9yIHByZXR0eSBtdWNoIGFsbCB0aGUgc2FtZSBoYXJk
d2FyZSAuLi4KCkluIGNvbnRyYXN0IHRvIHJhZGVvbmZiLCB0aGUgcmFkZW9uIGRyaXZlciBkb2Vz
bid0IHN1cHBvcnQgCnN1c3BlbmQtdG8tUkFNIG9uIEFwcGxlIFBvd2VyUEMgbm90ZWJvb2tzLgoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
