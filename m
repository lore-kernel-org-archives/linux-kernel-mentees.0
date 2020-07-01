Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C370EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 15:58:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 912D3207D0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 15:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zP1k9Vyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 912D3207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 302CA89089;
	Wed,  1 Jul 2020 15:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbd72YJ-WxBd; Wed,  1 Jul 2020 15:58:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A83F289026;
	Wed,  1 Jul 2020 15:58:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90EE9C0890;
	Wed,  1 Jul 2020 15:58:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 866C4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 15:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6F8C726428
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 15:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHNVMPVHP+Gp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 15:58:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B85262649E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 15:58:08 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B614207BB;
 Wed,  1 Jul 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593619088;
 bh=V1iDW3HLHhSqBPcQehF0Rgg3mQVIlF7VSD1AxxlZohs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zP1k9VygO6HMuMhSsK3Ri5ecwyhKTBVem6tv7+iZlkO2LfWUPUV8kB5w+xwQCC/yb
 NPWSYrq7lNKdPGH1kSf357yagD/OZvsRD5rkLejuyYhXie53xsFQIUIwXq5sqVL24C
 QWNqJuqt4nKNy53k2fBP6LoHQEIv1WZqAY2xP7+A=
Date: Wed, 1 Jul 2020 08:58:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200701085805.4dac84fb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200701125938.639447-5-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
 <20200701125938.639447-5-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Denis Kirjanov <kda@linux-powerpc.org>, David Dillow <dave@thedillows.org>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guy Tzalik <gtzalik@amazon.com>, Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ion Badulescu <ionut@badula.org>, Netanel Belgazal <netanel@amazon.com>,
 Jon Mason <jdmason@kudzu.us>, Saeed Bishara <saeedb@amazon.com>,
 Derek Chickles <dchickles@marvell.com>, "David S.
 Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 04/11] ena_netdev: use generic
	power management
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

T24gV2VkLCAgMSBKdWwgMjAyMCAxODoyOTozMSArMDUzMCBWYWliaGF2IEd1cHRhIHdyb3RlOgo+
IFdpdGggbGVnYWN5IFBNLCBkcml2ZXJzIHRoZW1zZWx2ZXMgd2VyZSByZXNwb25zaWJsZSBmb3Ig
bWFuYWdpbmcgdGhlCj4gZGV2aWNlJ3MgcG93ZXIgc3RhdGVzIGFuZCB0YWtlcyBjYXJlIG9mIHJl
Z2lzdGVyIHN0YXRlcy4KPiAKPiBBZnRlciB1cGdyYWRpbmcgdG8gdGhlIGdlbmVyaWMgc3RydWN0
dXJlLCBQQ0kgY29yZSB3aWxsIHRha2UgY2FyZSBvZgo+IHJlcXVpcmVkIHRhc2tzIGFuZCBkcml2
ZXJzIHNob3VsZCBkbyBvbmx5IGRldmljZS1zcGVjaWZpYyBvcGVyYXRpb25zLgo+IAo+IENvbXBp
bGUtdGVzdGVkIG9ubHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmFpYmhhdiBHdXB0YSA8dmFpYmhh
dmd1cHRhNDBAZ21haWwuY29tPgoKVGhpcyBvbmUgcHJvZHVjZXMgYSB3YXJuaW5nIG9uIGEgVz0x
IGJ1aWxkOgoKZHJpdmVycy9uZXQvZXRoZXJuZXQvYW1hem9uL2VuYS9lbmFfbmV0ZGV2LmM6NDQ2
NDoyNjogd2FybmluZzog4oCYZW5hX3BtX29wc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIDQ0NjQgfCBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMo
ZW5hX3BtX29wcywgZW5hX3N1c3BlbmQsIGVuYV9yZXN1bWUpOwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
