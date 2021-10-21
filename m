Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1383C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:08:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C32760FC0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C32760FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4F760F12;
	Thu, 21 Oct 2021 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOkmyYxjn3Hp; Thu, 21 Oct 2021 16:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7DEE960F0C;
	Thu, 21 Oct 2021 16:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6D4C0033;
	Thu, 21 Oct 2021 16:08:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A51CEC0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84799401B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8wld_Za6tso
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD83140017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:08:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AEFD611CB;
 Thu, 21 Oct 2021 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634832521;
 bh=3wcwNbtDNknQedZoy24cZfK1CiOqshIYIk3e2c4B9Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWhJ08GGIqTZw+TvT/nMCDAy7quf2FJv33jj0Ily06vxkI8rUxTQELDkeHb0u+NFl
 MD0Lx9+x7lhMM3GIAZfA1T2u0eNmQAG1bqpXTvz67evSI6p28cRymuvwfzx0MmCdPZ
 Eu9kyx0IRx+BQHrjfg6pUkXIBKHVfUT3rJ6PyHjkKsGXSiMQ2s0MWrlq5f/6WPUXfA
 12KC4ZTUvETH0cKn32kcKsPv7RGUIftWATLF8XYn+cHxWi3nvl7PC2jb98L+8EJMFN
 xtCzC0AmpDoL2r37xWXDC3EUt/EyyEmL8iLEASXb2kkCdjx5XS/xqqOzJAGW3sGtIs
 FzUF2rqmMe78Q==
Received: by pali.im (Postfix)
 id D8DB085E; Thu, 21 Oct 2021 18:08:38 +0200 (CEST)
Date: Thu, 21 Oct 2021 18:08:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211021160838.r7t7fmmeseaecfac@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
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

T24gVGh1cnNkYXkgMjEgT2N0b2JlciAyMDIxIDIwOjM3OjI2IE5hdmVlbiBOYWlkdSB3cm90ZToK
PiBBbiBNTUlPIHJlYWQgZnJvbSBhIFBDSSBkZXZpY2UgdGhhdCBkb2Vzbid0IGV4aXN0IG9yIGRv
ZXNuJ3QgcmVzcG9uZAo+IGNhdXNlcyBhIFBDSSBlcnJvci4gIFRoZXJlJ3Mgbm8gcmVhbCBkYXRh
IHRvIHJldHVybiB0byBzYXRpc2Z5IHRoZQo+IENQVSByZWFkLCBzbyBtb3N0IGhhcmR3YXJlIGZh
YnJpY2F0ZXMgfjAgZGF0YS4KPiAKPiBBZGQgYSBQQ0lfRVJST1JfUkVTUE9OU0UgZGVmaW5pdGlv
biBmb3IgdGhhdCBhbmQgdXNlIGl0IHdoZXJlCj4gYXBwcm9wcmlhdGUgdG8gbWFrZSB0aGVzZSBj
aGVja3MgY29uc2lzdGVudCBhbmQgZWFzaWVyIHRvIGZpbmQuCj4gCj4gQWxzbyBhZGQgaGVscGVy
IGRlZmluaXRpb25zIFNFVF9QQ0lfRVJST1JfUkVTUE9OU0UgYW5kCj4gUkVTUE9OU0VfSVNfUENJ
X0VSUk9SIHRvIG1ha2UgdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPiAKPiBTdWdnZXN0ZWQtYnk6
IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmF2
ZWVuIE5haWR1IDxuYXZlZW5uYWlkdTQ3OUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogUGFsaSBS
b2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvcGNpLmggfCA5
ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcGNpLmggYi9pbmNsdWRlL2xpbnV4L3BjaS5oCj4gaW5kZXgg
Y2Q4YWE2ZmNlMjA0Li42ODljODI3N2M1ODQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9w
Y2kuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGNpLmgKPiBAQCAtMTU0LDYgKzE1NCwxNSBAQCBl
bnVtIHBjaV9pbnRlcnJ1cHRfcGluIHsKPiAgLyogVGhlIG51bWJlciBvZiBsZWdhY3kgUENJIElO
VHggaW50ZXJydXB0cyAqLwo+ICAjZGVmaW5lIFBDSV9OVU1fSU5UWAk0Cj4gIAo+ICsvKgo+ICsg
KiBSZWFkaW5nIGZyb20gYSBkZXZpY2UgdGhhdCBkb2Vzbid0IHJlc3BvbmQgdHlwaWNhbGx5IHJl
dHVybnMgfjAuICBBCj4gKyAqIHN1Y2Nlc3NmdWwgcmVhZCBmcm9tIGEgZGV2aWNlIG1heSBhbHNv
IHJldHVybiB+MCwgc28geW91IG5lZWQgYWRkaXRpb25hbAo+ICsgKiBpbmZvcm1hdGlvbiB0byBy
ZWxpYWJseSBpZGVudGlmeSBlcnJvcnMuCj4gKyAqLwo+ICsjZGVmaW5lIFBDSV9FUlJPUl9SRVNQ
T05TRSAgICAgKH4wVUxMKQo+ICsjZGVmaW5lIFNFVF9QQ0lfRVJST1JfUkVTUE9OU0UodmFsKSAg
ICAoKih2YWwpID0gKCh0eXBlb2YoKih2YWwpKSkgUENJX0VSUk9SX1JFU1BPTlNFKSkKPiArI2Rl
ZmluZSBSRVNQT05TRV9JU19QQ0lfRVJST1IodmFsKSAoKHZhbCkgPT0gKCh0eXBlb2YodmFsKSkg
UENJX0VSUk9SX1JFU1BPTlNFKSkKPiArCj4gIC8qCj4gICAqIHBjaV9wb3dlcl90IHZhbHVlcyBt
dXN0IG1hdGNoIHRoZSBiaXRzIGluIHRoZSBDYXBhYmlsaXRpZXMgUE1FX1N1cHBvcnQKPiAgICog
YW5kIENvbnRyb2wvU3RhdHVzIFBvd2VyU3RhdGUgZmllbGRzIGluIHRoZSBQb3dlciBNYW5hZ2Vt
ZW50IGNhcGFiaWxpdHkuCj4gLS0gCj4gMi4yNS4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlz
dApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1t
ZW50ZWVzCg==
