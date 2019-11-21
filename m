Return-Path: <SRS0=RvA/=ZN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4351FC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 19:03:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF8820672
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 19:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9dRQ99A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF8820672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA1C387CD4;
	Thu, 21 Nov 2019 19:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC2pxBrXdNGT; Thu, 21 Nov 2019 19:03:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E19387527;
	Thu, 21 Nov 2019 19:03:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E6EDC1DD7;
	Thu, 21 Nov 2019 19:03:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48487C18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4432A861C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 19:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCaxWOQlMMWX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 19:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A3B1285910
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 19:03:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id o11so4848303qtr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 11:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=3pu7bTJZYqMMphObuD4a7m9ziq9HPsgBSFlqxFbRTGw=;
 b=d9dRQ99Amotdw9BAi/sut20bcBhHvR4wyJCGEx+XzLL8Mni32hxoMUnTkPrAf8UxI7
 7T2y0TRk64XnQtwq58xROGyNRMI7gfNFTh+g53QBuwmrw5TRz1NsjGLVDZzjMoBA2Zu0
 aElLHZMKHu9KodA1SuMEP3IOiGNS6lYj7L9sDZZxxhu1YiTiF5oujTlw8N88nE391rtW
 qr/FXAZLdOeWjOkQsmmUtcfZCOcNIXUog7mwXnDL4jqUjAJNgranqOCXF3pLDax6PngO
 7yaro+2OJso3FjbBSWpkR/hKeRZ0pbUL8FtTnjc2ilZHIRbBnQMaglOWC7F9gMGU4JuA
 ripA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=3pu7bTJZYqMMphObuD4a7m9ziq9HPsgBSFlqxFbRTGw=;
 b=qS/AjwZgf+o/YYFYuduCmuXeAs1RExtEOeWr2hjfBR3GBfK5fI/C2JTHuDcpGqeXQF
 zHZ2Vus2sGGcASuG9dv3xvN61rUpBRJGMgJ+B8ww3MwYVHPJOHHxUvfkxzZh+zhVFDC9
 KbejvVCOIA+wQmyua8ovZTNU7ytCEna0eFdfB1JAEEcV8cLqcU2gswHD1ehO17IZddBO
 L3+6HMhYKdup88Nz7N5ItvNPqqyfWnoBB1UqLwUDoY6Nxu+7yvkpcZXfsy8GFpiGrg6D
 zniDHPPFNozcsccjqWxmdhVKmibZUKjPswdmzJFGAKcGvAUe+ExDVnwPsSOXO9Bu7+us
 LMxA==
X-Gm-Message-State: APjAAAXiNMc8tXEp2HCM3LL26hYp1IRqiBe4E3KvvD9rQGKpeo/zrtvQ
 RcaSuoNzEdcCst2JxXZLT2Jv7VA+QmVlkg==
X-Google-Smtp-Source: APXvYqz4e2RksIuFclH4NbPv8ApvDcceA9tj3SyY2a/vTx0dQiNnaw8/Ng9x3vPgd+U3nd9LokiJZw==
X-Received: by 2002:ac8:1ad0:: with SMTP id h16mr10486404qtk.303.1574362987262; 
 Thu, 21 Nov 2019 11:03:07 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id b6sm2018134qtp.5.2019.11.21.11.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 11:03:06 -0800 (PST)
To: stable@vger.kernel.org
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <a02e01c5-635f-60c3-9d27-6c13abda8ffa@gmail.com>
Date: Thu, 21 Nov 2019 15:55:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Linux 5.3.12 BOOT TEST: Compiled, Booted,
	everything OK.
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
Content-Type: multipart/mixed; boundary="===============1160846623652368044=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============1160846623652368044==
Content-Type: multipart/alternative;
 boundary="------------A89B76AEF16B587B310428BE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A89B76AEF16B587B310428BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

~ 2hr uptime: no crashes, no new errors on dmesg, everything looks good.


*This pops up after diffing the output of kselftest though:*

< # ./reuseport_bpf: Unable to open tcp_fastopen sysctl for writing: 
Permission denied
---
 > # ./reuseport_bpf: ebpf error. log:
 > # 0: (bf) r6 = r1
 > # 1: (20) r0 = *(u32 *)skb[0]
 > # 2: (97) r0 %= 10
 > # 3: (95) exit
 > # processed 4 insns (limit 1000000) max_states_per_insn 0 
total_states 0 peak_states 0 mark_read 0
 > #
 > # : Operation not permitted

I did not run kselftest as root. I assume it is nothing noteworthy?



--------------A89B76AEF16B587B310428BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>~ 2hr uptime: no crashes, no new errors on dmesg, everything
      looks good.<br>
    </p>
    <p><br>
    </p>
    <p><b>This pops up after diffing the output of kselftest though:</b><br>
    </p>
    <p>&lt; # ./reuseport_bpf: Unable to open tcp_fastopen sysctl for
      writing: Permission denied<br>
      ---<br>
      &gt; # ./reuseport_bpf: ebpf error. log:<br>
      &gt; # 0: (bf) r6 = r1<br>
      &gt; # 1: (20) r0 = *(u32 *)skb[0]<br>
      &gt; # 2: (97) r0 %= 10<br>
      &gt; # 3: (95) exit<br>
      &gt; # processed 4 insns (limit 1000000) max_states_per_insn 0
      total_states 0 peak_states 0 mark_read 0<br>
      &gt; # <br>
      &gt; # : Operation not permitted<br>
    </p>
    <p>I did not run kselftest as root. I assume it is nothing
      noteworthy?</p>
    <p><br>
    </p>
  </body>
</html>

--------------A89B76AEF16B587B310428BE--

--===============1160846623652368044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1160846623652368044==--
