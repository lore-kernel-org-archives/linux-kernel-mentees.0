Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F938EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 16:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1474189B;
	Thu,  6 Jul 2023 16:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1474189B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rQG6cR+P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JS-1_sWyLiKA; Thu,  6 Jul 2023 16:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2132941841;
	Thu,  6 Jul 2023 16:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2132941841
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3BA0C0072;
	Thu,  6 Jul 2023 16:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00428C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 16:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE7D960BE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 16:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7D960BE6
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rQG6cR+P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJi5Dmy9_inQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 16:00:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D93160B95
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D93160B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 16:00:10 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-55ba5fae2e6so681372a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688659210; x=1691251210;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cX9kKxYIJv3ip+bm10ugdsP4ZscSU1mpF0YvzC6xnuo=;
 b=rQG6cR+PnkCS515HPL1UmtBIv6ie8WEoW01eti3dVLLSFt/0WAOYUmxuyGn0EGpE1C
 wHBQUjLOE6fKQWD7Lt/z8noWVWXiQs2UDXnRMbxw7LSxX/vWgUSi6ZPp1Hp71UUtkfQ5
 FErGt1+Tqy8dYNvnAiWLu4uc7NLawBPjl/9GBAIOwYgiX3xaf9GHuV6gU8piNn9FcGpj
 DDBYvk46oMpkEE+deY9FYAzA1OIL1SB1dwroVCauMxzs9Dnkf5OEwEOeBoDbOeVHEseE
 mOFWQtial0EFpSX/x6fILrfhhKsXelWEnPO5uTb3n6WwKrwpxOPaSuuH9OyEH2nLe8Iv
 kTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688659210; x=1691251210;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cX9kKxYIJv3ip+bm10ugdsP4ZscSU1mpF0YvzC6xnuo=;
 b=VrclJ2T7agLeF/XKsgdr2aPsFZaV1INraluQSrAqpFnLFQjv0b9gIIz3gCNKlF3f5g
 VqEu6ZCB67gQ/i5ADJiFFXVxMg5PI8ObYxUUL1bhzFYqn0qrEM+cf5v/EEI2X3hkRnXo
 C+8JIwDbR/4OTP0BQOIe/lQmvRQQ+z8SMfXnoHri6Hxuxi4GlYiMo8/St3oLFazWdfFj
 MpF9ZXy/OYy80RFbHlIn3dWepoxM6iYUgxEZHiyjE1hYu5F4/h+84mDXbM5fRVjPwqXJ
 7pja9imOLLnVrzkInscfFJFNA7rJeQniea0dNHdZJ1BpwUw8UeEhTxZ2ptdHl8iWT/em
 R3GA==
X-Gm-Message-State: ABy/qLbD1VSImo9ATmlVUEVkqUf8iquVG1nR8Is/LfrF0rmOaIaNXhcl
 DZnxMYMP/dpYcKWGUaPWWDc=
X-Google-Smtp-Source: APBJJlGqOX0uDpBiQab5K5TMuWuJwxSg0c7QOS7sIecNBCGIIn7JdIlWhRDfnT/EgC6ONYqoY5LZlg==
X-Received: by 2002:a05:6a20:244e:b0:130:6b27:729f with SMTP id
 t14-20020a056a20244e00b001306b27729fmr590616pzc.3.1688659209743; 
 Thu, 06 Jul 2023 09:00:09 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 ey2-20020a056a0038c200b006828a3c259fsm1464537pfb.104.2023.07.06.09.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:00:09 -0700 (PDT)
Message-ID: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
Date: Thu, 6 Jul 2023 23:00:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org
From: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: [PATCH v2] samples/bpf: Add more instructions to build dependencies
 and, configuration in README.rst
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Update the Documentation to mention that some samples require pahole
v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 samples/bpf/README.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
index 57f93edd1957..631592b83d60 100644
--- a/samples/bpf/README.rst
+++ b/samples/bpf/README.rst
@@ -14,6 +14,9 @@ Compiling requires having installed:
 Note that LLVM's tool 'llc' must support target 'bpf', list version
 and supported targets with command: ``llc --version``

+Some samples require pahole version 1.16 as a dependency. See
+https://docs.kernel.org/bpf/bpf_devel_QA.html for reference.
+
 Clean and configuration
 -----------------------

@@ -28,6 +31,10 @@ Configure kernel, defconfig for instance::

  make defconfig

+Some samples require support for BPF Type Format (BTF). To enable it,
open the
+generated config file, or use menuconfig (by "make menuconfig") to
enable the
+following configs: CONFIG_BPF_SYSCALL and CONFIG_DEBUG_INFO_BTF.
+
 Kernel headers
 --------------

-- 
2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
