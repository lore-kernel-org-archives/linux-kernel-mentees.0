Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F7C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Mar 2023 18:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A9984143;
	Thu, 23 Mar 2023 18:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A9984143
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n6jT3swI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agiCmk2r6js1; Thu, 23 Mar 2023 18:07:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3594584133;
	Thu, 23 Mar 2023 18:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3594584133
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08FD4C0071;
	Thu, 23 Mar 2023 18:07:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50B4BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B83F84134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B83F84134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YFCCPzIOyrz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5AE484133
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5AE484133
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:07:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7737B821FD;
 Thu, 23 Mar 2023 18:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DC2C433D2;
 Thu, 23 Mar 2023 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679594858;
 bh=oc36L9DihkP06ZEpUiHojWwKvkiSb9SLviWKHIqcMGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6jT3swINPJI7tV0q6QZGo8rRzTvM1sd9hd7nkxZTDCacMbR3qAnqKzHQsBsw+eQK
 ZmuAKi404zsyXMQAEwXs+F0DIdaglS3txcvnKeGxgPy7tAlUk/JINfzy1cHyqv2AgB
 zrD3h+Oxsdg+aIE7JTVU8t730BkVIy0jOOALUYVtH0fj00ZtegtO35jn0cZtkJwYW+
 +PrRVgMfManFNo2hjFeeFzbqDVkUByMs8tl8Y/dwXbGDraXBUhS3kmrSNWnAKdK/4u
 jUcX4kq+XMiEd+FKyw7MDQpbuL6YU3LZoQV3KRZgKIDHugY/mXLnH+O/fqoaCPVxV2
 SysveOeAPNmuw==
Date: Thu, 23 Mar 2023 13:07:37 -0500
From: Seth Forshee <sforshee@kernel.org>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: Re: [PATCH v1] selftests mount: Fix mount_setattr_test builds failed
Message-ID: <ZByVac3GsD7RFuaj@do-x1extreme>
References: <20230323172859.89085-1-tuananhlfc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323172859.89085-1-tuananhlfc@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, brauner@kernel.org,
 shuah@kernel.org
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTI6Mjg6NTlBTSArMDcwMCwgQW5oIFR1YW4gUGhhbiB3
cm90ZToKPiBXaGVuIGNvbXBpbGluZyBzZWxmdGVzdHMgd2l0aCB0YXJnZXQgbW91bnRfc2V0YXR0
ciBJIGVuY291bnRlcmVkIHNvbWUgZXJyb3JzIHdpdGggdGhlIGJlbG93IG1lc3NhZ2VzOgo+IG1v
dW50X3NldGF0dHJfdGVzdC5jOiBJbiBmdW5jdGlvbiDigJhtb3VudF9zZXRhdHRyX3RocmVhZOKA
mToKPiBtb3VudF9zZXRhdHRyX3Rlc3QuYzozNDM6MTY6IGVycm9yOiB2YXJpYWJsZSDigJhhdHRy
4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCj4gICAzNDMgfCAgICAgICAg
IHN0cnVjdCBtb3VudF9hdHRyIGF0dHIgPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICBefn5+
fn5+fn5+Cj4gCj4gVGhlc2UgZXJyb3JzIGFyZSBtaWdodCBiZSBiZWNhdXNlIG9mIGxpbnV4L21v
dW50LmggaXMgbm90IGluY2x1ZGVkLiBUaGlzIHBhdGNoIHJlc29sdmVzIHRoYXQgaXNzdWUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxmY0BnbWFpbC5jb20+Cj4g
LS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0YXR0
cl90ZXN0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0
YXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tb3VudF9zZXRhdHRyL21vdW50
X3NldGF0dHJfdGVzdC5jCj4gaW5kZXggNTgyNjY5Y2EzOGU5Li43Y2ExM2E5MjRlMzQgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW91bnRfc2V0YXR0ci9tb3VudF9zZXRh
dHRyX3Rlc3QuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIv
bW91bnRfc2V0YXR0cl90ZXN0LmMKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAjaW5jbHVkZSA8Z3Jw
Lmg+Cj4gICNpbmNsdWRlIDxzdGRib29sLmg+Cj4gICNpbmNsdWRlIDxzdGRhcmcuaD4KPiArI2lu
Y2x1ZGUgImxpbnV4L21vdW50LmgiCj4gIAo+ICAjaW5jbHVkZSAiLi4va3NlbGZ0ZXN0X2hhcm5l
c3MuaCIKCk9vcHMsIEkgaGFkIG1lYW50IHRvIHNlbmQgdGhpcyBmaXggYmVmb3JlIGFuZCBmb3Jn
b3QuCgpPbmUgbWlub3Igbml0LiBJJ2QgcHJlZmVyIHRvIHNlZSBhbmdsZSBicmFja2V0cyB1c2Vk
IGZvciB0aGlzIGluY2x1ZGUsCnNpbmNlIHRoZSBrZXJuZWwgaGVhZGVyIHBhdGggaXMgcGFzc2Vk
IHVzaW5nIC1pc3lzdGVtIGFuZCBhbmdsZSBicmFja2V0cwphcmUgbW9yZSBjb252ZW50aW9uYWwg
Zm9yIHN5c3RlbSBpbmNsdWRlcy4gSXQncyBhbHNvIGhvdyBtb3N0IG90aGVyCnNlbGZ0ZXN0cyBp
bmNsdWRlIGtlcm5lbCBoZWFkZXJzLiBCdXQgZWl0aGVyIHdheToKCkFja2VkLWJ5OiBTZXRoIEZv
cnNoZWUgKERpZ2l0YWxPY2VhbikgPHNmb3JzaGVlQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
