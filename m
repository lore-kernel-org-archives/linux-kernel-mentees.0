Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B319C35DE1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:11:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB51D21744
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqRWDHUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB51D21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B026F868FB;
	Tue, 25 Feb 2020 13:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKrW6ADMLOiu; Tue, 25 Feb 2020 13:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 678958691E;
	Tue, 25 Feb 2020 13:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41A30C1D87;
	Tue, 25 Feb 2020 13:10:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D552C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 296B620023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWJEkDZ2KCOJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:10:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 96D9920370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:10:50 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x185so7170276pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 05:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NdIi3p1G+pK48BoZW2xQ7s8pQgL985dQmFMs11pogIQ=;
 b=SqRWDHUPS48bv05ymWTtEWbtaU6DtthfFLOZ1wsFsdOFONm1ay26GExnGv9Tl345Tl
 HVuFnYYTPNXOPMDICvlrv62A73Uw8gGvceNrRTsyT9bENOEKnCGiBRiJD4rImS8VRZPA
 VK19KMOxAJIclJoijNvCVwyIpuWLeQDqg6mPEGyPks+595xkaytNoCB6mBqGijGKkDvY
 Yv7a6pEVGsPGKn1a4KH6Y52oEjKVSZeJfaQmuuv5yfStcW+GPvEalRurj+W8FJ/gXbHo
 eXwEsLj+M9o/BPp7PtNkAg9zrZmlkSjdythQnWvnPPWKKSlXzpf5K91Z8mJ4NP8URcUP
 FKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NdIi3p1G+pK48BoZW2xQ7s8pQgL985dQmFMs11pogIQ=;
 b=P6wYcBoSXoV7IusS4CHSsMJVFG5cscS6FNNn6z81V5E7XWop7SGhXWl5Hki1+TvL9j
 /KV9ycmreNqMhQpGIEyu+4b0iPJQ9SAK7NYrCLviwG/c5ILWVTzt3jRKjbZfoCI0vSMQ
 2p1C+60woUH3nk7BIzMxlYrR6AAmiODy5PH6c7IuvvNOKyE+S3ol5FbUyOHN0gHCUkQz
 GVhzi6zgbEENCH7fmqHdQ+TooI7IF/Vgl1JCPymZ8kkTw1l23WiQy1jeEF8JkCYW2aIk
 KniHSJByLNAgz5zeubw4YbrS7UxN4FOqg+ku7EgVyPkYQx5I2KWZQfE2ipQsDL2mIsbG
 ZrZg==
X-Gm-Message-State: APjAAAXy8VEPAhISXM5z2p0CFE9n//Aqpk0lOUMF250FLxUocClvYcz0
 zD1UFkuAMEIlfOntQhoCQDk=
X-Google-Smtp-Source: APXvYqym5rY6K9md/Bot2AiUakY1J+acKKuoxOz41x81VdMxJZeV6UGEPQhMOPZsxtH1Co4cyMHbnQ==
X-Received: by 2002:a63:1926:: with SMTP id z38mr56722083pgl.303.1582636250052; 
 Tue, 25 Feb 2020 05:10:50 -0800 (PST)
Received: from workstation-portable ([103.87.56.186])
 by smtp.gmail.com with ESMTPSA id d1sm16084363pgi.63.2020.02.25.05.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:10:49 -0800 (PST)
Date: Tue, 25 Feb 2020 18:40:41 +0530
From: Amol Grover <frextrite@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200225131041.GA8660@workstation-portable>
References: <20200222063835.14328-1-frextrite@gmail.com>
 <20200222063835.14328-2-frextrite@gmail.com>
 <20200224.131801.2179562246092982372.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224.131801.2179562246092982372.davem@davemloft.net>
Cc: paulmck@kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, madhuparnabhowmik10@gmail.com, kuba@kernel.org,
 joel@joelfernandes.org, kuznet@ms2.inr.ac.ru,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] ipmr: Add lockdep expression
 to ipmr_for_each_table macro
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

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6MTg6MDFQTSAtMDgwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IEFtb2wgR3JvdmVyIDxmcmV4dHJpdGVAZ21haWwuY29tPgo+IERhdGU6IFNh
dCwgMjIgRmViIDIwMjAgMTI6MDg6MzYgKzA1MzAKPiAKPiA+IGlwbXJfZm9yX2VhY2hfdGFibGUo
KSB1c2VzIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KCkgZm9yCj4gPiB0cmF2ZXJzaW5nIG91dHNp
ZGUgb2YgYW4gUkNVIHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uIGJ1dAo+ID4gdW5kZXIgdGhl
IHByb3RlY3Rpb24gb2YgcGVybmV0X29wc19yd3NlbS4gSGVuY2UgYWRkIHRoZQo+ID4gY29ycmVz
cG9uZGluZyBsb2NrZGVwIGV4cHJlc3Npb24gdG8gc2lsZW5jZSB0aGUgZm9sbG93aW5nCj4gPiBm
YWxzZS1wb3NpdGl2ZSB3YXJuaW5nIGF0IGJvb3Q6Cj4gPiAKPiA+IFsgICAgMC42NDUyOTJdID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiBbICAgIDAuNjQ1Mjk0XSBXQVJOSU5HOiBz
dXNwaWNpb3VzIFJDVSB1c2FnZQo+ID4gWyAgICAwLjY0NTI5Nl0gNS41LjQtc3RhYmxlICMxNyBO
b3QgdGFpbnRlZAo+ID4gWyAgICAwLjY0NTI5N10gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+IFsgICAgMC42NDUyOTldIG5ldC9pcHY0L2lwbXIuYzoxMzYgUkNVLWxpc3QgdHJhdmVy
c2VkIGluIG5vbi1yZWFkZXIgc2VjdGlvbiEhCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFtb2wg
R3JvdmVyIDxmcmV4dHJpdGVAZ21haWwuY29tPgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGNhdXNl
cyBidWlsZCBwcm9ibGVtcywgcGxlYXNlIGZpeCBhbmQgcmVzdWJtaXQgdGhlIGVudGlyZQo+IHNl
cmllczoKPiAKPiBbZGF2ZW1AbG9jYWxob3N0IG5ldC1uZXh0XSQgbWFrZSBuZXQvaXB2NC9pcG1y
Lm8gCj4gICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAo+ICAgQ0FMTCAgICBzY3Jp
cHRzL2F0b21pYy9jaGVjay1hdG9taWNzLnNoCj4gICBERVNDRU5EICBvYmp0b29sCj4gICBDQyAg
ICAgIG5ldC9pcHY0L2lwbXIubwo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvcmN1bGlzdC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgv
cGlkLmg6NSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NjaGVkLmg6
MTQsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC91YWNjZXNzLmg6NSwK
PiAgICAgICAgICAgICAgICAgIGZyb20gbmV0L2lwdjQvaXBtci5jOjI0Ogo+IG5ldC9pcHY0L2lw
bXIuYzogSW4gZnVuY3Rpb24g4oCYaXBtcl9nZXRfdGFibGXigJk6Cj4gLi9pbmNsdWRlL2xpbnV4
L3JjdWxpc3QuaDo2MzoyNTogd2FybmluZzogc3VnZ2VzdCBwYXJlbnRoZXNlcyBhcm91bmQg4oCY
JibigJkgd2l0aGluIOKAmHx84oCZIFstV3BhcmVudGhlc2VzXQo+ICAgUkNVX0xPQ0tERVBfV0FS
TighY29uZCAmJiAhcmN1X3JlYWRfbG9ja19hbnlfaGVsZCgpLCAgXAo+IC4vaW5jbHVkZS9saW51
eC9yY3VwZGF0ZS5oOjI2Mzo1Mjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhSQ1Vf
TE9DS0RFUF9XQVJO4oCZCj4gICAgaWYgKGRlYnVnX2xvY2tkZXBfcmN1X2VuYWJsZWQoKSAmJiAh
X193YXJuZWQgJiYgKGMpKSB7IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+IC4vaW5jbHVkZS9saW51eC9yY3VsaXN0Lmg6MzgxOjc6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2xpc3RfY2hlY2tfcmN14oCZCj4gICBmb3Ig
KF9fbGlzdF9jaGVja19yY3UoZHVtbXksICMjIGNvbmQsIDApLCAgIFwKPiAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fgo+IG5ldC9pcHY0L2lwbXIuYzoxMTM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmGxpc3RfZm9yX2VhY2hfZW50cnlfcmN14oCZCj4gICBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3JjdShtcnQsICZuZXQtPmlwdjQubXJfdGFibGVzLCBsaXN0LCBcCj4gICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+IG5ldC9pcHY0L2lwbXIuYzoxMzg6Mjogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmGlwbXJfZm9yX2VhY2hfdGFibGXigJkKPiAgIGlwbXJfZm9yX2VhY2hfdGFi
bGUobXJ0LCBuZXQpIHsKPiAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KClRoaXMgaXMgYSBidWlsZCB3
YXJuaW5nIGR1ZSB0byBpbmNvcnJlY3Qgb3BlcmF0b3IgcHJlY2VkZW5jZSBpbgpfX2xpc3RfY2hl
Y2tfcmN1IG1hY3JvLiBUaGlzIGhhcyBhbHJlYWR5IGJlZW4gcmVwb3J0ZWQgYW5kIHRoZSBwYXRj
aApzdWJtaXR0ZWQgWzFdLiBJbmZhY3QgdGhlIHBhdGNoIGlzIGN1cnJlbnRseSBxdWV1ZWQgZm9y
IHY1LjcuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExODE4
ODYvCgpUaGFua3MKQW1vbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1l
bnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
