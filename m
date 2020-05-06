Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063B4C4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 06:29:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18F72073A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 06:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2rgZVAG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18F72073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EF4A8808D;
	Wed,  6 May 2020 06:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwWgUdKLVvAh; Wed,  6 May 2020 06:29:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 750EA87FC3;
	Wed,  6 May 2020 06:29:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B702C0863;
	Wed,  6 May 2020 06:29:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60CD2C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3BA4420441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqX1J2tp3rDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:29:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 3500320387
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:29:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h26so505129qtu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 May 2020 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=fS1/vDuISkGlyu8gipr/126eanAwBwyBiL2zsLto8+4=;
 b=K2rgZVAGS9HxP3ooRdX4tv6dvx+7SrUQkMNCdKE2A6LLS7jPRIHMyFYYlxX+CaZIhM
 X3ww2JE4FbyFulxWSAQpA6sdizzPV5xDqonfxPP43vjYBmEiq03UjyIwBzx7ZgV73KSG
 47VoPSTo9mdMZEjlgF6ts32pBZniYQ+ZcjcNCvpq/3x7JX6J2fb3qeyBEp7DjfgLs12p
 QCkO9yzarB4uv7sBQNvH7wN1Q+us7ZwDUKQSwuiQ24nWlY/FqbsvyGhDbmNlAWz0raMG
 WCZhEG9nVa5bn1TDcqYci4O0gnrTWo7HGfoRWtlsIeqEji8UbxlTOzXcNH5932pN8CgX
 H1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=fS1/vDuISkGlyu8gipr/126eanAwBwyBiL2zsLto8+4=;
 b=VLR/p3HQSLxdM3V2EKpfnr3EbZUiSu07ODpwx5eS5iRzlmqZzErirzEW1Ig3cunGDR
 Xxxz2KQ0F6y1gDCtl5HLYt5+0sOgEL1Xv/Y/oYJqZU3GnDZqBvmnNkrhXq8TR9FxNWe8
 mMM32EbPVj95baYg3prv8sznRtETN10iu4bDCZkSaiqehXeOFW5/USpjVjct1/zmMFyl
 wBqtsD7xaFy1iGPwm8825IBy8Qd1f/LaFbscPqsRbTmLnBQhDxdsJ97CoArRAcjnpniC
 6JHKmFRrVw304qFJGRU7WgN6dvJnjfwSklr0V/7IYSCqLgexRtneJr7gFjGm75UjbYwj
 e7TA==
X-Gm-Message-State: AGi0PuZzQ3qZyV0Fbz3+2Nc1h0Zuf09g8mPTLso78MPpD4zuSShvtFb/
 Vf10klM+U8LSHajbiWnbusI=
X-Google-Smtp-Source: APiQypLjUMcUx34Qhck+85XSfWa7THO0BOfK8MGpx/WktyzeRW2K3f9dgoRL1SKlBpPwRSZMlzmJqA==
X-Received: by 2002:ac8:514d:: with SMTP id h13mr6778900qtn.226.1588746541995; 
 Tue, 05 May 2020 23:29:01 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
 by smtp.gmail.com with ESMTPSA id j16sm950797qkl.118.2020.05.05.23.28.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:29:01 -0700 (PDT)
Date: Wed, 6 May 2020 03:28:17 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
In-Reply-To: <20200503095105.6b8f0d3f@coco.lan>
References: <20200503095105.6b8f0d3f@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?kstewart=40linuxfoundation.org?="
 <kstewart@linuxfoundation.org>, "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 08/11] media: vidtv: implement a PSI generator
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

SGkgTWF1cm8sCgoKCj4+ICtzdGF0aWMgdTMyCj4+ICt2aWR0dl9wc2lfdHNfcHNpX3dyaXRlX2lu
dG8oc3RydWN0IHBzaV93cml0ZV9hcmdzIGFyZ3MpCj4+ICt7Cj4+ICsJLyoKPj4gKwkgKiBQYWNr
ZXRpemUgUFNJIHNlY3Rpb25zIGludG8gVFMgcGFja2V0czoKPj4gKwkgKiBwdXNoIGEgVFMgaGVh
ZGVyICg0Ynl0ZXMpIGV2ZXJ5IDE4NCBieXRlcwo+PiArCSAqIG1hbmFnZSB0aGUgY29udGludWl0
eV9jb3VudGVyCj4+ICsJICogYWRkIHN0dWZmaW5nIGFmdGVyIHRoZSBDUkMKPj4gKwkgKi8KPj4g
Kwo+PiArCXUzMiAgbmJ5dGVzX3Bhc3RfYm91bmRhcnkgPSAoYXJncy5kZXN0X29mZnNldCAlIFRT
X1BBQ0tFVF9MRU4pOwo+PiArCWJvb2wgYWxpZ25lZCAgICAgICAgICAgICAgPSBuYnl0ZXNfcGFz
dF9ib3VuZGFyeSA9PSAwOwo+PiArCj4+ICsJLyoKPj4gKwkgKiB3aGV0aGVyIHdlIG5lZWQgdG8g
ZnJhZ21lbnQgdGhlIGRhdGEgaW50byBtdWx0aXBsZSB0cyBwYWNrZXRzCj4+ICsJICogaWYgd2Ug
YXJlIGFsaWduZWQgd2UgbmVlZCB0byBzcGFyZSBvbmUgYnl0ZSBmb3IgdGhlIHBvaW50ZXJfZmll
bGQKPj4gKwkgKi8KPj4gKwlib29sIHNwbGl0ID0gKGFsaWduZWQpID8KPj4gKwkJICAgICBhcmdz
LmxlbiA+IFRTX1BBWUxPQURfTEVOIC0gMSA6Cj4+ICsJCSAgICAgbmJ5dGVzX3Bhc3RfYm91bmRh
cnkgKyBhcmdzLmxlbiA+IFRTX1BBQ0tFVF9MRU47Cj4+ICsKPj4gKwkvKiBob3cgbXVjaCB3ZSBj
YW4gd3JpdGUgaW4gdGhpcyBwYWNrZXQgKi8KPj4gKwl1MzIgcGF5bG9hZF93cml0ZV9sZW4gPSAo
c3BsaXQpID8KPj4gKwkJCQkoYWxpZ25lZCkgICAgID8gVFNfUEFZTE9BRF9MRU4gICAgICAgOgo+
PiArCQkJCVRTX1BBQ0tFVF9MRU4gLSBuYnl0ZXNfcGFzdF9ib3VuZGFyeSA6Cj4+ICsJCQkJYXJn
cy5sZW47Cj4+ICsKPj4gKwlzdHJ1Y3QgcHNpX3dyaXRlX2FyZ3MgbmV3X2FyZ3MgPSB7MH07Cj4+
ICsJc3RydWN0IHZpZHR2X21wZWdfdHMgdHNfaGVhZGVyID0gezB9Owo+PiArCj4+ICsJdTMyIG5i
eXRlcyA9IDA7ICAvKiBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBieSB0aGlzIGZ1bmN0aW9uICov
Cj4+ICsJdTMyIHRlbXAgICA9IDA7Cj4+ICsKPj4gKwkvKiBKdXN0IGEgc2FuaXR5IGNoZWNrLCBz
aG91bGQgbm90IHJlYWxseSBoYXBwZW4gYmVjYXVzZSB3ZSBzdHVmZgo+PiArCSAqIHRoZSBwYWNr
ZXQgd2hlbiB3ZSBmaW5pc2ggYSBzZWN0aW9uLCBpLmUuIHdoZW4gd2Ugd3JpdGUgdGhlIGNyYyBh
dAo+PiArCSAqIHRoZSBlbmQuIEJ1dCBpZiB0aGlzIGhhcHBlbnMgdGhlbiB3ZSBoYXZlIG1lc3Nl
ZCB1cCB0aGUgbG9naWMKPj4gKwkgKiBzb21ld2hlcmUuCj4+ICsJICovCj4+ICsJV0FSTl9PTihh
cmdzLm5ld19wc2lfc2VjdGlvbiAmJiAhYWxpZ25lZCk7Cj4gIAo+IFBsZWFzZSB1c2UgYSByYXRl
bGltaXRlZCBwcmludGsgaW5zdGVhZCAoaGVyZSBhbmQgb24gYWxsIHNpbWlsYXIgY2FzZXMKPiBh
dCB0aGUgVFMgZ2VuZXJhdG9yKS4KPiAgCj4gQWxzbywgSSB0aGluayB0aGF0LCBvbiBzdWNoIGNh
c2UsIHRoZSBkcml2ZXIgc2hvdWxkIGJlIGZpbGxpbmcgdGhlCj4gcmVtYWluaW5nIGZyYW1lIHdp
dGggcGFkIGJ5dGVzLiBFLiBnLjoKPiAgCj4gCS8qICAKPiAJICogQXNzdW1pbmcgdGhhdCB2aWR0
dl9tZW1zZXQoKSBhcmdzIGZyb20gcGF0Y2ggMDYvMTEgd2VyZSBjaGFuZ2VkICAKPiAJICogYWNj
b3JkaW5nIHdpdGggdGhpcyBwcm90b3R5cGU6ICAKPiAJICovCj4gCXNpemVfdCB2aWR0dl9tZW1z
ZXQodm9pZCAqdG8sIHNpemVfdCB0b19vZmZzZXQsIHNpemVfdCB0b19zaXplLAo+IAkJCSAgICB1
OCBjLCBzaXplX3QgbGVuKTsKPiAgCj4gIAo+IAkjZGVmaW5lIFRTX0ZJTExfQllURSAweGZmCj4g
IAo+IAlpZiAoYXJncy5uZXdfcHNpX3NlY3Rpb24gJiYgIWFsaWduZWQpIHsKPiAJCXByX3dhcm5f
cmF0ZWxpbWl0KCJXYXJuaW5nOiBQU0kgbm90IGFsaWduZWQuIFJlLWFsaWduaW5nIGl0XG4iKTsK
PiAgCj4gCQl2aWR0dl9tZW1zZXQoYXJncy5kZXN0X2J1ZiwKPiAJCQkgICAgIGFyZ3MuZGVzdF9v
ZmZzZXQgKyBuYnl0ZXNfcGFzdF9ib3VuZGFyeSwKPiAJCQkgICAgIGFyZ3MuZGVzdF9idWZfc3os
Cj4gCQkJICAgICBUU19GSUxMX0JZVEUsCQkKPiAJCQkgICAgIFRTX1BBQ0tFVF9MRU4gLSBuYnl0
ZXNfcGFzdF9ib3VuZGFyeSk7Cj4gCQlhcmdzLmRlc3Rfb2Zmc2V0ICs9IFRTX1BBQ0tFVF9MRU4g
LSBuYnl0ZXNfcGFzdF9ib3VuZGFyeTsKPiAJCWFsaWduZWQgPSAxOwo+IAkJbmJ5dGVzX3Bhc3Rf
Ym91bmRhcnkgPSAwOwo+IAl9Cj4gIAoKU3VyZSwgdGhhdCdzIGZpbmUgdGhlbiEgSnVzdCB0byBi
ZSBjbGVhciB0aGlzIHNob3VsZCBub3QgaGFwcGVuIGF0IGFsbCwKYmVjYXVzZSB0aGUgd3JpdGVz
IHNob3VsZCBnbyB0aHJvdWdoIG9uZSBvZiB0aGVzZSBmb3VyIGZ1bmN0aW9ucyAoSUlSQyEpOgoK
dTMyIHZpZHR2X3RzX251bGxfd3JpdGVfaW50byhzdHJ1Y3QgbnVsbF9wYWNrZXRfd3JpdGVfYXJn
cyBhcmdzKQp1MzIgdmlkdHZfdHNfcGNyX3dyaXRlX2ludG8oc3RydWN0IHBjcl93cml0ZV9hcmdz
IGFyZ3MpCgouLi53aGljaCB3aWxsIHdyaXRlIGEgc2luZ2xlIHBhY2tldCBhdCBhIHRpbWUsIHRo
dXMgbGVhdmluZyB0aGUgYnVmZmVyCmFsaWduZWQgaWYgaXQgd2FzIGFscmVhZHkgYWxpZ25lZCB0
byBiZWdpbiB3aXRoLAoKYW5kCgp1MzIgdmlkdHZfcGVzX3dyaXRlX2ludG8oc3RydWN0IHBlc193
cml0ZV9hcmdzIGFyZ3MpCnN0YXRpYyB1MzIKdmlkdHZfcHNpX3RzX3BzaV93cml0ZV9pbnRvKHN0
cnVjdCBwc2lfd3JpdGVfYXJncyBhcmdzKQoKLi4ud2hpY2ggd2lsbCBwYWQgd2hlbiB0aGV5IGZp
bmlzaCB3cml0aW5nIGEgUEVTIHBhY2tldCBvciBhIHRhYmxlCnNlY3Rpb24sIHJlc3BlY3RpdmVs
eS4KCkkgbGVmdCB0aGVzZSB3YXJuaW5ncyBiZWhpbmQgYXMgYSB3YXkgdG8gd2FybiBtZSBpZiB0
aGUgcGFkZGluZyBsb2dpYwppdHNlbGYgaXMgYnJva2VuLgoKCgo+IFBsZWFzZSB1c2UgYSByYXRl
bGltaXRlZCBwcmludGsgaW5zdGVhZCAoaGVyZSBhbmQgb24gYWxsIHNpbWlsYXIgY2FzZXMKPiBh
dCB0aGUgVFMgZ2VuZXJhdG9yKS4KCk9LLgoKCgo+PiArc3RhdGljIHZvaWQgdmlkdHZfcHNpX2Rl
c2NfdG9fYmUoc3RydWN0IHZpZHR2X3BzaV9kZXNjICpkZXNjKQo+PiArewo+PiArCS8qCj4+ICsJ
ICogQ29udmVydCBkZXNjcmlwdG9yIGVuZGlhbm5lc3MgdG8gYmlnLWVuZGlhbiBvbiBhIGZpZWxk
LWJ5LWZpZWxkCj4+IGJhc2lzCj4+ICsJICogd2hlcmUgYXBwbGljYWJsZQo+PiArCSAqLwo+PiAr
Cj4+ICsJc3dpdGNoIChkZXNjLT50eXBlKSB7Cj4+ICsJLyogbm90aGluZyBkbyBkbyAqLwo+PiAr
CWNhc2UgU0VSVklDRV9ERVNDUklQVE9SOgo+PiArCQlicmVhazsKPj4gKwljYXNlIFJFR0lTVFJB
VElPTl9ERVNDUklQVE9SOgo+PiArCQljcHVfdG9fYmUzMnMoJigoc3RydWN0IHZpZHR2X3BzaV9k
ZXNjX3JlZ2lzdHJhdGlvbiAqKQo+PiArCQkJICAgICBkZXNjKS0+Zm9ybWF0X2lkZW50aWZpZXIp
Owo+PiArCQlwcl9hbGVydCgiJXM6IGRlc2NyaXB0b3IgdHlwZSAlZCBmb3VuZFxuIiwKPj4gKwkJ
CSBfX2Z1bmNfXywKPj4gKwkJCSBkZXNjLT50eXBlKTsKPj4gKwkJcHJfYWxlcnQoIiVzOiBjaGFu
Z2UgJ2FkZGl0aW9uYWxfaW5mbycgZW5kaWFubmVzcyBiZWZvcmUKPj4gY2FsbGluZ1xuIiwKPj4g
KwkJCSBfX2Z1bmNfXyk7Cj4gIAo+IFRoZSBhYm92ZSBwcl9hbGVydCgpIGNhbGxzIHNvdW5kIHdl
aXJkLiBXaHkgYXJlIHlvdSB1bmNvbmRpdGlvbmFsbHkKPiBjYWxsaW5nIGl0IChhbmQgc3RpbGwg
ZG9pbmcgdGhlIEJFIGNvbnZlcnNpb24pIGZvciBhbGwKPiBSRUdJU1RSQVRJT05fREVTQ1JJUFRP
UiB0eXBlcz8KClRvIGJlIGhvbmVzdCwgSSBkaWQgbm90IGtub3cgd2hhdCB0byBkby4gSGVyZSdz
IHdoYXQgMTM4MTgtMSBoYXMgdG8gc2F5CmFib3V0IHJlZ2lzdHJhdGlvbiBkZXNjcmlwdG9yczoK
Cj4yLjYuOQo+IFNlbWFudGljIGRlZmluaXRpb24gb2YgZmllbGRzIGluIHJlZ2lzdHJhdGlvbiBk
ZXNjcmlwdG9yCj5mb3JtYXRfaWRlbnRpZmllciDigJMgVGhlIGZvcm1hdF9pZGVudGlmaWVyIGlz
IGEgMzItYml0IHZhbHVlIG9idGFpbmVkCj5mcm9tIGEgUmVnaXN0cmF0aW9uIEF1dGhvcml0eSBh
cyBkZXNpZ25hdGVkIGJ5Cj5JU08vSUVDIEpUQyAxL1NDIDI5Lgo+YWRkaXRpb25hbF9pZGVudGlm
aWNhdGlvbl9pbmZvIOKAkyBUaGUgbWVhbmluZyBvZgo+YWRkaXRpb25hbF9pZGVudGlmaWNhdGlv
bl9pbmZvIGJ5dGVzLCBpZiBhbnksIGFyZSBkZWZpbmVkIGJ5IHRoZQo+YXNzaWduZWUgb2YgdGhh
dCBmb3JtYXRfaWRlbnRpZmllciwgYW5kIG9uY2UgZGVmaW5lZCB0aGV5IHNoYWxsIG5vdCBjaGFu
Z2UuCgpTbyBJIHRvb2sgdGhlIGN1ZSBmcm9tIGxpYmR2YnY1IGFuZCBkZWZpbmVkIHRoZSBmb2xs
b3dpbmcgc3RydWN0IGZvciBpdCwKd2l0aCBhIGZsZXhpYmxlIGFycmF5IG1lbWJlciBhdCB0aGUg
ZW5kOgoKc3RydWN0IHZpZHR2X3BzaV9kZXNjX3JlZ2lzdHJhdGlvbiB7Cgl1OCB0eXBlOwoJdTgg
bGVuZ3RoOwoJc3RydWN0IHZpZHR2X3BzaV9kZXNjICpuZXh0OwoKCS8qCgkgKiBUaGUgZm9ybWF0
X2lkZW50aWZpZXIgaXMgYSAzMi1iaXQgdmFsdWUgb2J0YWluZWQgZnJvbSBhIFJlZ2lzdHJhdGlv
bgoJICogQXV0aG9yaXR5IGFzIGRlc2lnbmF0ZWQgYnkgSVNPL0lFQyBKVEMgMS9TQyAyOS4KCSAq
LwoJdTMyIGZvcm1hdF9pZGVudGlmaWVyOwoJLyoKCSAqIFRoZSBtZWFuaW5nIG9mIGFkZGl0aW9u
YWxfaWRlbnRpZmljYXRpb25faW5mbyBieXRlcywgaWYgYW55LCBhcmUKCSAqIGRlZmluZWQgYnkg
dGhlIGFzc2lnbmVlIG9mIHRoYXQgZm9ybWF0X2lkZW50aWZpZXIsIGFuZCBvbmNlIGRlZmluZWQK
CSAqIHRoZXkgc2hhbGwgbm90IGNoYW5nZS4KCSAqLwoJdTggYWRkaXRpb25hbF9pZGVudGlmaWNh
dGlvbl9pbmZvW107Cn0gX19wYWNrZWQKCgpBcyB5b3Uga25vdywgSSB3YXMgY2hhbmdpbmcgdGhl
IGVuZGlhbm5lc3MgZnJvbSBob3N0IHRvIEJFIGJlZm9yZQpzZXJpYWxpemluZyBhbmQgdGhlbiBj
aGFuZ2luZyBiYWNrIGZyb20gQkUgdG8gaG9zdC4gR2l2ZW4gdGhlIHN0cnVjdApkZWZpbml0aW9u
IGFib3ZlLCB0aGVyZSB3YXMgbm8gd2F5IHRvIGRvIHRoaXMgdG8gdGhlCidhZGRpdGlvbmFsX2lk
ZW50aWZpY2F0aW9uX2luZm8nIG1lbWJlciwgc2luY2Ugd2UgZG8gbm90IGtub3cgaXRzIGxheW91
dC4KCklmIHdlIGdvIHdpdGggeW91ciBhcHByb2FjaCBpbnN0ZWFkIChpLmUuIHVzaW5nIF9fYmUx
NiwgX19iZTMyLi4uZXRjKQp0aGVuIEkgdGhpbmsgd2UgY2FuIHJlbW92ZSB0aGVzZSB0d28gZnVu
Y3Rpb25zIChhbmQgbW9yZSkKCgp0aGFua3MsCi0gRGFuaWVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
