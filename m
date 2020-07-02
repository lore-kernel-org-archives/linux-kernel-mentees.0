Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D7FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 16:36:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE98820720
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 16:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSOdujBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE98820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A980E8A11C;
	Thu,  2 Jul 2020 16:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chBHw9YfoF3p; Thu,  2 Jul 2020 16:36:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 421428A111;
	Thu,  2 Jul 2020 16:36:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27680C0890;
	Thu,  2 Jul 2020 16:36:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EF2CC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 16:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A83A88F88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 16:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdnuRM3Zb8ES
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 16:36:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E8FF488F4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 16:36:46 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 463C320720;
 Thu,  2 Jul 2020 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593707806;
 bh=1ydFiyyVngUAcsAU9csrnJizTY4RtX1aoV1iBzBWUlI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TSOdujByBkyI0xINU2tkk0vhYTIWtDh73W4gCqhyvEaWlGwnx+IWwIaE24ysdf1Fj
 9q1Qz83OusuUWT8nFFKHu4ErPQ+0Ikb7tT7v86bvJ+PvQY1tHAAOtOh1PdxhsiaXzk
 wF2H/sV/ZVyDVLypv6l9e5SKv/CIGCaoCth0ZtiI=
Date: Thu, 2 Jul 2020 09:36:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200702093645.13e0018a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200702063632.289959-3-vaibhavgupta40@gmail.com>
References: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
 <20200702063632.289959-3-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Shahed Shaikh <shshaikh@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] qlcninc: use generic
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

T24gVGh1LCAgMiBKdWwgMjAyMCAxMjowNjozMiArMDUzMCBWYWliaGF2IEd1cHRhIHdyb3RlOgo+
IFdpdGggbGVnYWN5IFBNLCBkcml2ZXJzIHRoZW1zZWx2ZXMgd2VyZSByZXNwb25zaWJsZSBmb3Ig
bWFuYWdpbmcgdGhlCj4gZGV2aWNlJ3MgcG93ZXIgc3RhdGVzIGFuZCB0YWtlcyBjYXJlIG9mIHJl
Z2lzdGVyIHN0YXRlcy4gQW5kIHRoZXkgdXNlIFBDSQo+IGhlbHBlciBmdW5jdGlvbnMgdG8gZG8g
aXQuCj4gCj4gQWZ0ZXIgdXBncmFkaW5nIHRvIHRoZSBnZW5lcmljIHN0cnVjdHVyZSwgUENJIGNv
cmUgd2lsbCB0YWtlIGNhcmUgb2YKPiByZXF1aXJlZCB0YXNrcyBhbmQgZHJpdmVycyBzaG91bGQg
ZG8gb25seSBkZXZpY2Utc3BlY2lmaWMgb3BlcmF0aW9ucy4KPiAKPiAuc3VzcGVuZCgpIGNhbGxz
IF9fcWxjbmljX3NodXRkb3duLCB3aGljaCB0aGVuIGNhbGxzIHFsY25pY184Mnh4X3NodXRkb3du
Owo+IC5yZXN1bWUoKSAgY2FsbHMgX19xbGNuaWNfcmVzdW1lLCAgIHdoaWNoIHRoZW4gY2FsbHMg
cWxjbmljXzgyeHhfcmVzdW1lOwo+IAo+IEJvdGggLi4uODJ4eC4uKCkgYXJlIGRlZmluZSBpbgo+
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3Fsb2dpYy9xbGNuaWMvcWxjbmljX2h3LmMgYW5kIGFyZSB1
c2VkIG9ubHkgaW4KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9xbG9naWMvcWxjbmljL3FsY25pY19t
YWluLmMuCj4gCj4gSGVuY2UgdXBncmFkZSB0aGVtIGFuZCByZW1vdmUgUENJIGZ1bmN0aW9uIGNh
bGxzLCBsaWtlIHBjaV9zYXZlX3N0YXRlKCkgYW5kCj4gcGNpX2VuYWJsZV93YWtlKCksIGluc2lk
ZSB0aGVtCj4gCj4gQ29tcGlsZS10ZXN0ZWQgb25seS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWYWli
aGF2IEd1cHRhIDx2YWliaGF2Z3VwdGE0MEBnbWFpbC5jb20+Cgpkcml2ZXJzL25ldC9ldGhlcm5l
dC9xbG9naWMvcWxjbmljL3FsY25pY19ody5jOiBJbiBmdW5jdGlvbiDigJhxbGNuaWNfODJ4eF9z
aHV0ZG93buKAmToKZHJpdmVycy9uZXQvZXRoZXJuZXQvcWxvZ2ljL3FsY25pYy9xbGNuaWNfaHcu
YzoxNjUyOjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhyZXR2YWzigJkgWy1XdW51c2Vk
LXZhcmlhYmxlXQogMTY1MiB8ICBpbnQgcmV0dmFsOwogICAgICB8ICAgICAgXn5+fn5+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1t
ZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
