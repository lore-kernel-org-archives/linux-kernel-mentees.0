Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B23C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48936108E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D48936108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91DBB60F0C;
	Thu, 21 Oct 2021 15:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svYXmqko0Bad; Thu, 21 Oct 2021 15:59:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5F54660692;
	Thu, 21 Oct 2021 15:59:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A88CC001C;
	Thu, 21 Oct 2021 15:59:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5972C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C391560692
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbcNkdJStImR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43724605F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:59:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92059611F2;
 Thu, 21 Oct 2021 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634831960;
 bh=KPsjXWIvxRCwuDpa6Tvl31WU0C1Lqvs1IzWAmvt1LIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbjTRlbgoq1kwcCmsdjF6aOe2HMQK3qhZn4f6pwey2aCZwN/CceqGeZEd1NVVct/O
 kAtaIu0D2RzfDizb0fIaGV7yHSP7jJbkgt55srwlnfMkB82DUjcz0CJqbBsQUy4uWY
 IBoamL9aWl4OH1LwOg86ZcJBhBfrYJAu2hgznF4gLGRNWK5xVQ5rD6BityDTdeNgwS
 cRnb8Wpu7DVARlwxGUaTouRT4DDc4QAdUViv1b/jQiIFIHaDQG/uaFhrUhuqvsqihO
 mh/P73eh7rmz07vr2UZwwLI5zkWoGq4S3mbrF3PmKMvhKpfCLTXNCiUnOpogyL0ERX
 wqANqVprTGV4Q==
Received: by pali.im (Postfix)
 id 6EFCD85E; Thu, 21 Oct 2021 17:59:18 +0200 (CEST)
Date: Thu, 21 Oct 2021 17:59:18 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 02/25] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <20211021155918.kigwwylvdmsuyd3z@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, linuxppc-dev@lists.ozlabs.org
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

T24gVGh1cnNkYXkgMjEgT2N0b2JlciAyMDIxIDIwOjM3OjI3IE5hdmVlbiBOYWlkdSB3cm90ZToK
PiBNYWtlIFBDSV9PUF9SRUFEIGFuZCBQQ0lfVVNFUl9SRUFEX0NPTkZJRyBzZXQgdGhlIGRhdGEg
dmFsdWUgd2l0aCBlcnJvcgo+IHJlc3BvbnNlICh+MCksIHdoZW4gdGhlIFBDSSBkZXZpY2UgcmVh
ZCBieSBhIGhvc3QgY29udHJvbGxlciBmYWlscy4KPiAKPiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUg
Y29udHJvbGxlciBkcml2ZXJzIG5vIGxvbmdlciBuZWVkIHRvIGZhYnJpY2F0ZQo+ICh+MCkgdmFs
dWUgd2hlbiB0aGV5IGRldGVjdCBlcnJvci4gSXQgYWxzbyAgZ3VyYW50ZWVzIHRoYXQgdGhlIGVy
cm9yCj4gcmVzcG9uc2UgKH4wKSBpcyBhbHdheXMgc2V0IHdoZW4gdGhlIGNvbnRyb2xsZXIgZHJp
dmVycyBmYWlscyB0byByZWFkIGEKPiBjb25maWcgcmVnaXN0ZXIgZnJvbSBhIGRldmljZS4KPiAK
PiBUaGlzIG1ha2VzIGVycm9yIHJlc3BvbnNlIGZhYnJpY2F0aW9uIGNvbnNpc3RlbnQgYW5kIGhl
bHBzIGluIHJlbW92YWwgb2YKPiBhIGxvdCBvZiByZXBlYXRlZCBjb2RlLgo+IAo+IFN1Z2dlc3Rl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gTmFpZHUgPG5h
dmVlbm5haWR1NDc5QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBr
ZXJuZWwub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9wY2kvYWNjZXNzLmMgfCAxMCArKysrKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2FjY2Vzcy5jIGIvZHJpdmVycy9wY2kvYWNjZXNzLmMK
PiBpbmRleCA0NjkzNTY5NWNmYjkuLjBmNzMyYmEyZjcxYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3BjaS9hY2Nlc3MuYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2FjY2Vzcy5jCj4gQEAgLTQyLDcgKzQy
LDEwIEBAIGludCBub2lubGluZSBwY2lfYnVzX3JlYWRfY29uZmlnXyMjc2l6ZSBcCj4gIAlpZiAo
UENJXyMjc2l6ZSMjX0JBRCkgcmV0dXJuIFBDSUJJT1NfQkFEX1JFR0lTVEVSX05VTUJFUjsJXAo+
ICAJcGNpX2xvY2tfY29uZmlnKGZsYWdzKTsJCQkJCQlcCj4gIAlyZXMgPSBidXMtPm9wcy0+cmVh
ZChidXMsIGRldmZuLCBwb3MsIGxlbiwgJmRhdGEpOwkJXAo+IC0JKnZhbHVlID0gKHR5cGUpZGF0
YTsJCQkJCQlcCj4gKwlpZiAocmVzKQkJCQkJCQlcCj4gKwkJU0VUX1BDSV9FUlJPUl9SRVNQT05T
RSh2YWx1ZSk7CQkJCVwKPiArCWVsc2UJCQkJCQkJCVwKPiArCQkqdmFsdWUgPSAodHlwZSlkYXRh
OwkJCQkJXAo+ICAJcGNpX3VubG9ja19jb25maWcoZmxhZ3MpOwkJCQkJXAo+ICAJcmV0dXJuIHJl
czsJCQkJCQkJXAo+ICB9Cj4gQEAgLTIyOCw3ICsyMzEsMTAgQEAgaW50IHBjaV91c2VyX3JlYWRf
Y29uZmlnXyMjc2l6ZQkJCQkJCVwKPiAgCXJldCA9IGRldi0+YnVzLT5vcHMtPnJlYWQoZGV2LT5i
dXMsIGRldi0+ZGV2Zm4sCQkJXAo+ICAJCQkJCXBvcywgc2l6ZW9mKHR5cGUpLCAmZGF0YSk7CVwK
PiAgCXJhd19zcGluX3VubG9ja19pcnEoJnBjaV9sb2NrKTsJCQkJXAo+IC0JKnZhbCA9ICh0eXBl
KWRhdGE7CQkJCQkJXAo+ICsJaWYgKHJldCkJCQkJCQkJXAo+ICsJCVNFVF9QQ0lfRVJST1JfUkVT
UE9OU0UodmFsKTsJCQkJXAo+ICsJZWxzZQkJCQkJCQkJXAo+ICsJCSp2YWwgPSAodHlwZSlkYXRh
OwkJCQkJXAo+ICAJcmV0dXJuIHBjaWJpb3NfZXJyX3RvX2Vycm5vKHJldCk7CQkJCVwKPiAgfQkJ
CQkJCQkJCVwKPiAgRVhQT1JUX1NZTUJPTF9HUEwocGNpX3VzZXJfcmVhZF9jb25maWdfIyNzaXpl
KTsKPiAtLSAKPiAyLjI1LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
