Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACD7C54FC9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 01:20:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A004A21974
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 01:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHUDnoeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A004A21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 736C2204CE;
	Mon, 20 Apr 2020 01:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWPT5bSAI1Rq; Mon, 20 Apr 2020 01:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 94E0D20002;
	Mon, 20 Apr 2020 01:20:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80DFEC1D7E;
	Mon, 20 Apr 2020 01:20:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1494C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F9CC87079
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cy7hUa1rUrVp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:20:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8FCBE87032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 01:20:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f13so10087945wrm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Apr 2020 18:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=yAP9eT8kJ5Bdwacl7397uWhXUM9vHzwzJI0Y9yAMLxY=;
 b=ZHUDnoehM8THEhy42gJYPU4B7q/A/2zAkadc9izfjEAfpv1q0qd9hdI1LHRgi47niT
 aVUIDCF7ffPjylbKiCue6/Ptv5iZPK//Nih/mI3RhRZVULmyFv9tB+wwo4MjmKluAO1g
 E9k50s/bftmCb+50eQ+ROdLQAnRSTJvzmfDji2xHHH0jsgeYeHOwuXvaBYS8KAzCvUiB
 Za2szGHJLgTYBFknFd4PmIUkHIA7GWSIli8nAWa9Ki+QLMGVl52NRsdAsx7nKZvdjFju
 7wVy3wdwgd1CPzuOJLyuUZevw0uu6558QDbeMKepey24I7UZmCSJ2ydsYyvs2zJJt++b
 RGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=yAP9eT8kJ5Bdwacl7397uWhXUM9vHzwzJI0Y9yAMLxY=;
 b=DrOHLw2mM1M6p/TRVgewMBsp2NIoUBxIJJ0YRf+Uo6KfTaMtikWL0uz83yqhUgpz2T
 Y0kt2qHw24/SrHrbXvo7Opikii+w94+YVa4oAQ/bJT8ySoD2Cd8du4bAoLhAbBvCje4l
 gpObNy3XIx42u+wXzUCM0jlUEiOLBO5ay+Ls34DC/IGgMA8V/WVrrQ5flwmzVlL4RFd0
 wg4eGNdX8K6TiWGQuGt61gfgwYepHawXS8siwWmH844ZMjFyzosOe3F4he0fif6qWNMX
 Uul+PXmi5OJBbXSs3RC6Je+NvgbDkyg6/VB2ahQoau4ZiX2tUHqo8GHeqY5Bp6R/xWQN
 z9TA==
X-Gm-Message-State: AGi0PubirPKb7nvqThuZjgQ8esnZvO6uhsMh2lp/uoK55dOA9ON5Tn0o
 KP+qSG96CBoZbCAfDkGWcbM=
X-Google-Smtp-Source: APiQypI4yF7ftXL28OmSVoRHBoRLXdouytBzMzVFGz6cARu5DCPvv7rcX4dBF9yilSh+o5pfFB3Zfw==
X-Received: by 2002:a5d:5085:: with SMTP id a5mr17273424wrt.394.1587345607883; 
 Sun, 19 Apr 2020 18:20:07 -0700 (PDT)
Received: from net.saheed (5402C526.dsl.pool.telekom.hu. [84.2.197.38])
 by smtp.gmail.com with ESMTPSA id w11sm17347666wmi.32.2020.04.19.18.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 18:20:07 -0700 (PDT)
To: skhan@linuxfoundation.org, mchehab@kernel.org
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
Date: Mon, 20 Apr 2020 02:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] Clarification on the behaviour of
	checkpatch.pl
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
Content-Type: multipart/mixed; boundary="===============6672952599127452660=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============6672952599127452660==
Content-Type: multipart/alternative;
 boundary="------------9FEC24DFE35BBD05E6ECA5F0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9FEC24DFE35BBD05E6ECA5F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

My experience is that checkpatch.pl will not flag some warnings when I use

the '-f' flag. This especially true for .rst files. My understanding is 
that this flag

is needed to use it with a raw source file instead of a patch.

Please, I will like to confirm if this is a normal behaviour or is it my 
system setup.

Below is an example from the current stable release linux-5.6.y

    [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
    ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
    total: 0 errors, 0 warnings, 279 lines checked

    ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
    obvious style problems and is ready for submission.


    [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
    ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
    WARNING: Possible unwrapped commit description (prefer a maximum 75
    chars per line)
    #6:
    TAA is a hardware vulnerability that allows unprivileged speculative
    access to

    ERROR: Does not appear to be a unified-diff format patch

    total: 1 errors, 1 warnings, 0 lines checked

    NOTE: For some of the reported defects, checkpatch may be able to
           mechanically convert to the typical style using --fix or
    --fix-inplace.

    ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has style
    problems, please review.

    NOTE: If any of the errors are false positives, please report
           them to the maintainer, see CHECKPATCH in MAINTAINERS.


    Thank you.

    Bolarinwa Saheed


--------------9FEC24DFE35BBD05E6ECA5F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>My experience is that checkpatch.pl will not flag some warnings
      when I use</p>
    <p> the '-f' flag. This especially true for .rst files. My
      understanding is that this flag</p>
    <p>is needed to use it with a raw source file instead of a patch.</p>
    <p>Please, I will like to confirm if this is a normal behaviour or
      is it my system setup.</p>
    <p>Below is an example from the current stable release linux-5.6.y</p>
    <blockquote>
      <p>[saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
        ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst <br>
        total: 0 errors, 0 warnings, 279 lines checked<br>
        <br>
        ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
        obvious style problems and is ready for submission.<br>
      </p>
      <p><br>
      </p>
      <p>[saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
        ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst <br>
        WARNING: Possible unwrapped commit description (prefer a maximum
        75 chars per line)<br>
        #6: <br>
        TAA is a hardware vulnerability that allows unprivileged
        speculative access to<br>
        <br>
        ERROR: Does not appear to be a unified-diff format patch<br>
        <br>
        total: 1 errors, 1 warnings, 0 lines checked<br>
        <br>
        NOTE: For some of the reported defects, checkpatch may be able
        to<br>
              mechanically convert to the typical style using --fix or
        --fix-inplace.<br>
        <br>
        ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has
        style problems, please review.<br>
        <br>
        NOTE: If any of the errors are false positives, please report<br>
              them to the maintainer, see CHECKPATCH in MAINTAINERS.</p>
      <p><br>
      </p>
      <p>Thank you.</p>
      <p>Bolarinwa Saheed<br>
      </p>
    </blockquote>
  </body>
</html>

--------------9FEC24DFE35BBD05E6ECA5F0--

--===============6672952599127452660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6672952599127452660==--
