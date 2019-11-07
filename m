Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB601C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 19:05:55 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49B721D7E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 19:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMKqtIsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49B721D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 93FE8E60;
	Thu,  7 Nov 2019 19:05:55 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD1A5DC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 19:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 66FDF712
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 19:05:53 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id g18so1236729qvp.8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 07 Nov 2019 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W47odrIZjcYj4z0Bgkfmue2TCHoiOu56PCWwIh8207g=;
	b=mMKqtIsq5pYYAfZq2O+8PKS6LuoNfzmmsez9yRUYkHSSU/sFfqaFYiuykAOrmHjpdO
	iPdMku3aBjtDrw1zEfGG1dz17wpBhtqcevu7Lo0iIM8jtfWqkOlyyoIWijjCJq5NVxqB
	X2xB9wMzKESpobnCUIqgKric4uF6oJHLVbvLT3sRVAbCmSA1sE0rc/+NJibDJJBbwL0/
	EKXPuRTmPx7JAYngCv7bhF/FJitCOCP4Or/Q30CCMj+cNoZRNTlp/SvSetRPgG+2kkqM
	Ok1kS5o13/rZYYEOiza/EzqA34y9MN3peKdGtC1itTzYpEzLHQMgk7FPC/Tfg6iCARgF
	DVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W47odrIZjcYj4z0Bgkfmue2TCHoiOu56PCWwIh8207g=;
	b=hIyecG6883ZznbJYozqHv8Robn5fYgZYms+f7sEoDjpbICW3G8mi2V4HSTFMwEC4f/
	ffBDYsa/W16yRy0mkTjQMhNWFwU6BAmcOORzp17eEBoijqtPHKdAJyssYdxt6prCDazq
	EESbGYLaSBC5JdFJkZckp1BVQLyy7sYN21/ukMI+mY8lQJiOH8mQ8SqqlbDnWvl5r198
	husbHUghoS8a5+P/CtMzQywJ6Gz6QxJqhFcmfmTR99i5XdaubiPBnBlqfBhRb6W6RPTp
	80+nNw85LH30VFFLuqEjK0+UuIpsIb4hM5aKaJN7VnO90LY76OlW5ra0yTyvpIFRji7I
	uUlg==
X-Gm-Message-State: APjAAAXpmehqPqDFDvnfCFmApo7WXskIKYbYXzfrukU606f9IHRaq+b7
	BqWm+ygTVvIxjd7RD4tndPc=
X-Google-Smtp-Source: APXvYqxhEAzOELijW4I0V72qVYbNj3+14XAXPmhY2Xi5OjfA8i2GcsCy1+UGFSvZBQ+tREInF2pbCg==
X-Received: by 2002:a0c:a046:: with SMTP id b64mr5088475qva.6.1573153548680;
	Thu, 07 Nov 2019 11:05:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	h21sm153692qkj.116.2019.11.07.11.05.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 11:05:48 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com
Date: Thu,  7 Nov 2019 15:57:55 -0300
Message-Id: <20191107185755.29586-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [RFC PATCH] Documentation: perf: fix
	kernel-doc warnings in imx-ddr.rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

RnJvbTogIkRhbmllbCBXLiBTLiBBbG1laWRhIiA8ZHdsc2FsbWVpZGFAZ21haWwuY29tPgoKVW5l
eHBlY3RlZCBpbmRlbnRhdGlvbiBlcnJvcnMgd2VyZSByZXBvcnRlZCBkdWUgdG8gbWlzc2luZyBi
bGFuayBsaW5lcy4KTm93IGZpeGVkLiBObyBjaGFuZ2UgaW4gY29udGVudCBvdGhlcndpc2UuCgpT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVy4gUy4gQWxtZWlkYSA8ZHdsc2FsbWVpZGFAZ21haWwuY29t
PgotLS0KIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbXgtZGRyLnJzdCB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW14LWRkci5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3BlcmYvaW14LWRkci5yc3QKaW5kZXggNTE3YTIwNWFiYWQ2Li43NWM4YjQ2YmE2Zjkg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbXgtZGRyLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW14LWRkci5yc3QKQEAgLTE4LDYg
KzE4LDcgQEAgVGhlICJmb3JtYXQiIGRpcmVjdG9yeSBkZXNjcmliZXMgZm9ybWF0IG9mIHRoZSBj
b25maWcgKGV2ZW50IElEKSBhbmQgY29uZmlnMQogZGV2aWNlcy9pbXg4X2RkcjAvZm9ybWF0Ly4g
VGhlICJldmVudHMiIGRpcmVjdG9yeSBkZXNjcmliZXMgdGhlIGV2ZW50cyB0eXBlcwogaGFyZHdh
cmUgc3VwcG9ydGVkIHRoYXQgY2FuIGJlIHVzZWQgd2l0aCBwZXJmIHRvb2wsIHNlZSAvc3lzL2J1
cy9ldmVudF9zb3VyY2UvCiBkZXZpY2VzL2lteDhfZGRyMC9ldmVudHMvLgorCiAgIGUuZy46Ogog
ICAgICAgICBwZXJmIHN0YXQgLWEgLWUgaW14OF9kZHIwL2N5Y2xlcy8gY21kCiAgICAgICAgIHBl
cmYgc3RhdCAtYSAtZSBpbXg4X2RkcjAvcmVhZC8saW14OF9kZHIwL3dyaXRlLyBjbWQKQEAgLTMx
LDE2ICszMiwxOSBAQCBpbiB0aGUgZHJpdmVyLgogICBGaWx0ZXIgaXMgZGVmaW5lZCB3aXRoIHR3
byBjb25maWd1cmF0aW9uIHBhcnRzOgogICAtLUFYSV9JRCBkZWZpbmVzIEF4SUQgbWF0Y2hpbmcg
dmFsdWUuCiAgIC0tQVhJX01BU0tJTkcgZGVmaW5lcyB3aGljaCBiaXRzIG9mIEF4SUQgYXJlIG1l
YW5pbmdmdWwgZm9yIHRoZSBtYXRjaGluZy4KKwogICAgICAgICAw77yaY29ycmVzcG9uZGluZyBi
aXQgaXMgbWFza2VkLgogICAgICAgICAxOiBjb3JyZXNwb25kaW5nIGJpdCBpcyBub3QgbWFza2Vk
LCBpLmUuIHVzZWQgdG8gZG8gdGhlIG1hdGNoaW5nLgogCiAgIEFYSV9JRCBhbmQgQVhJX01BU0tJ
TkcgYXJlIG1hcHBlZCBvbiBEUENSMSByZWdpc3RlciBpbiBwZXJmb3JtYW5jZSBjb3VudGVyLgog
ICBXaGVuIG5vbi1tYXNrZWQgYml0cyBhcmUgbWF0Y2hpbmcgY29ycmVzcG9uZGluZyBBWElfSUQg
Yml0cyB0aGVuIGNvdW50ZXIgaXMKICAgaW5jcmVtZW50ZWQuIFBlcmYgY291bnRlciBpcyBpbmNy
ZW1lbnRlZCBpZgorCiAgICAgICAgICAgQXhJRCAmJiBBWElfTUFTS0lORyA9PSBBWElfSUQgJiYg
QVhJX01BU0tJTkcKIAogICBUaGlzIGZpbHRlciBkb2Vzbid0IHN1cHBvcnQgZmlsdGVyIGRpZmZl
cmVudCBBWEkgSUQgZm9yIGF4aWQtcmVhZCBhbmQgYXhpZC13cml0ZQogICBldmVudCBhdCB0aGUg
c2FtZSB0aW1lIGFzIHRoaXMgZmlsdGVyIGlzIHNoYXJlZCBiZXR3ZWVuIGNvdW50ZXJzLgorCiAg
IGUuZy46OgogICAgICAgICBwZXJmIHN0YXQgLWEgLWUgaW14OF9kZHIwL2F4aWQtcmVhZCxheGlf
bWFzaz0weE1NTU0sYXhpX2lkPTB4RERERC8gY21kCiAgICAgICAgIHBlcmYgc3RhdCAtYSAtZSBp
bXg4X2RkcjAvYXhpZC13cml0ZSxheGlfbWFzaz0weE1NTU0sYXhpX2lkPTB4RERERC8gY21kCkBA
IC00OCw1ICs1Miw2IEBAIGluIHRoZSBkcml2ZXIuCiAgIE5PVEU6IGF4aV9tYXNrIGlzIGludmVy
dGVkIGluIHVzZXJzcGFjZShpLmUuIHNldCBiaXRzIGFyZSBiaXRzIHRvIG1hc2spLCBhbmQKICAg
aXQgd2lsbCBiZSByZXZlcnRlZCBpbiBkcml2ZXIgYXV0b21hdGljYWxseS4gc28gdGhhdCB0aGUg
dXNlciBjYW4ganVzdCBzcGVjaWZ5CiAgIGF4aV9pZCB0byBtb25pdG9yIGEgc3BlY2lmaWMgaWQs
IHJhdGhlciB0aGFuIGhhdmluZyB0byBzcGVjaWZ5IGF4aV9tYXNrLgorCiAgIGUuZy46OgogICAg
ICAgICBwZXJmIHN0YXQgLWEgLWUgaW14OF9kZHIwL2F4aWQtcmVhZCxheGlfaWQ9MHgxMi8gY21k
LCB3aGljaCB3aWxsIG1vbml0b3IgQVJJRD0weDEyCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
