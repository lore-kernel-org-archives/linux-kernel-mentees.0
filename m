Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D55C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 00:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B576740272;
	Tue, 28 Jun 2022 00:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B576740272
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=1Dh37h2N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0JoU67CaMlU; Tue, 28 Jun 2022 00:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CBCED400D6;
	Tue, 28 Jun 2022 00:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBCED400D6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3138C0032;
	Tue, 28 Jun 2022 00:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0446AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFCCB82BFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCCB82BFD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1Dh37h2N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIM5vrJekYbm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:08:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED07D813BE
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED07D813BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:08:17 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-fe023ab520so14995395fac.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 17:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=EEpp/zjJADSHGlJFmARkvy4L9G20CW1cf6ywBKPRwHw=;
 b=1Dh37h2NuEq5zRy5X7JojrbpsbFb4xI7DHrVa4AK73nIpB7vT3nBexk9D0YZ19Iqzw
 47fLtcy25yPOe/dliWkv2DAAl9lwM/nYGQpL/uazmKZXjyBt+tD3oKNizarDeTnBrWEx
 VzkGEpee8PeCsZHGpuTkYPT/p7+vWbndGWlGPcCjPfQah/qTRO7hSWFeyof/AsBoDP2N
 CFP3yR7MO0PDig+VE0IVBmhM0B3Lzod8U2Hg4do4BRubV/rchjYBFnzzVb4SSiak7UdC
 YtpWZk9XP22M5cqbGvOsmv7FufyWIEyWUO/P3IpXQOBTGf2jGjLbYFYuRiuvhiUCsmBf
 4knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EEpp/zjJADSHGlJFmARkvy4L9G20CW1cf6ywBKPRwHw=;
 b=D9UN9QPQEB3sV2seK2OrXsi7AeWjtfo18LcEvHRQXLnG1eFgh+p4FzTfqbaxuAL+QH
 LftO4of8rnogwvFNz8PqxlJWo+ysvl72iEa6nICOIoE9agGpw52wTWYhJ/9GZKQNA38j
 bjDgeZFllyjZ3J8m7taYe7ui4l4jB/sxrInEUJ77HMMBFNfTYK/9KXnHP2bEwLaweF0+
 2AXpnpBBa1V1av7oDOkC+oPdamnxaHLPKgti+6If+BvvAvdglooBa/EN64D8r5MRe1Z2
 fWvRvf6o5zj//pwQUDkkwJSlPchxYuRYjwRiaso8I6aodz+anUqIprqwMChv+TDkpL4E
 ryXw==
X-Gm-Message-State: AJIora9A9BQ+larYj5nSR92i953tpjzZOrF9q2+DcRoGMrqL9HbRizLq
 dJJSvT3IETf3SeWs++P+KSawfRMhwtzLdYWsqIpb/A==
X-Google-Smtp-Source: AGRyM1v3jnPv5cuHpx94FRP26ei5mxp/XAukxAl4zEla6eKLM2Q1NSNu7m+CRXyjyBbCB9AsEKEThB2Cu9AZdLgxBO4=
X-Received: by 2002:a05:6870:7c0e:b0:108:b9a4:8704 with SMTP id
 je14-20020a0568707c0e00b00108b9a48704mr2488361oab.146.1656374896661; Mon, 27
 Jun 2022 17:08:16 -0700 (PDT)
MIME-Version: 1.0
From: Coleman Dietsch <dietschc@csp.edu>
Date: Mon, 27 Jun 2022 19:08:05 -0500
Message-ID: <CABvydfLc57kidrM_jSrsHcdu0vhVXv_2eqX=3x5xQwKdcA7Hdg@mail.gmail.com>
Subject: [PATCH] docs: fix include path causing kselftest net fatal error
To: Shuah Khan <skhan@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Eric Dumazet <edumazet@google.com>, davem@davemloft.net, kuba@kernel.org, 
 pabeni@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 kafai@fb.com
Content-Type: multipart/mixed; boundary="00000000000054f01005e276d556"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--00000000000054f01005e276d556
Content-Type: multipart/alternative; boundary="00000000000054f00e05e276d554"

--00000000000054f00e05e276d554
Content-Type: text/plain; charset="UTF-8"



--00000000000054f00e05e276d554
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--00000000000054f00e05e276d554--
--00000000000054f01005e276d556
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-include-path-causing-kselftest-net-fatal-error.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-include-path-causing-kselftest-net-fatal-error.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l4xeox2l0>
X-Attachment-Id: f_l4xeox2l0

RnJvbSAxZTg1YjUwYzRlY2VlOTIxZDA4YjcwNzQzNjAyMjhlOGFhNTFhYzcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDb2xlbWFuIERpZXRzY2ggPGRpZXRzY2hjQGNzcC5lZHU+CkRh
dGU6IE1vbiwgMjcgSnVuIDIwMjIgMTg6Mzg6NDIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBGaXgg
aW5jbHVkZSBwYXRoIGNhdXNpbmcga3NlbGZ0ZXN0IG5ldCBmYXRhbCBlcnJvcgoKVGhlIGluY29y
cmVjdCBwYXRoIGlzIGNhdXNpbmcgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIHRyeWluZyB0byBy
dW4gbmV0CmtzZWxmdGVzdHM6CgpjbGFuZyAtTzIgLXRhcmdldCBicGYgLWMgYnBmL25hdDZ0bzQu
YyAtSS4uLy4uL2JwZiAtSS4uLy4uLy4uL2xpYiAtSS4uLy4uLy4uLy4uLy4uL3Vzci9pbmNsdWRl
LyAtbyAvaG9tZS9jb2xlL0RldmVsb3BtZW50L2xpbnV4L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25ldC9icGYvbmF0NnRvNC5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBicGYvbmF0NnRvNC5jOjQz
OgouLi8uLi8uLi9saWIvYnBmL2JwZl9oZWxwZXJzLmg6MTE6MTA6IGZhdGFsIGVycm9yOiAnYnBm
X2hlbHBlcl9kZWZzLmgnIGZpbGUgbm90IGZvdW5kCiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn4KMSBlcnJvciBnZW5lcmF0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDb2xlbWFuIERpZXRzY2ggPGRp
ZXRzY2hjQGNzcC5lZHU+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2JwZi9NYWtl
ZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9icGYvTWFrZWZpbGUg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvYnBmL01ha2VmaWxlCmluZGV4IDhhNjljOTFm
Y2NhMC4uOGNjYWY4NzMyZWIyIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
ZXQvYnBmL01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9icGYvTWFr
ZWZpbGUKQEAgLTIsNyArMiw3IEBACiAKIENMQU5HID89IGNsYW5nCiBDQ0lOQ0xVREUgKz0gLUku
Li8uLi9icGYKLUNDSU5DTFVERSArPSAtSS4uLy4uLy4uL2xpYgorQ0NJTkNMVURFICs9IC1JLi4v
Li4vLi4vLi4vbGliCiBDQ0lOQ0xVREUgKz0gLUkuLi8uLi8uLi8uLi8uLi91c3IvaW5jbHVkZS8K
IAogVEVTVF9DVVNUT01fUFJPR1MgPSAkKE9VVFBVVCkvYnBmL25hdDZ0bzQubwotLSAKMi4zNC4x
Cgo=
--00000000000054f01005e276d556
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--00000000000054f01005e276d556--
