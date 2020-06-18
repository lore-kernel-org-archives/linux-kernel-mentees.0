Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F178FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:36:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDE420890
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="yR3Onkl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BDE420890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3593688A95;
	Thu, 18 Jun 2020 20:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17B6-jGSdI3R; Thu, 18 Jun 2020 20:36:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A31D889F6;
	Thu, 18 Jun 2020 20:36:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E40C9C07FF;
	Thu, 18 Jun 2020 20:36:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF837C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BAF3022744
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TLto58tAkXa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:36:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 4CA0120515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:36:54 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id di13so3416373qvb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZYzhuBZS9rkuOZVHOQsEAGRBl1qfIjePfyvKHgBh4OM=;
 b=yR3Onkl6GAedASEnIYKoSQdDDq55u7rSUAdcrerC2I36aFDVFgdQNmz+YntLg/KJqk
 guHQb1gluVExpam6Acdgf6Zzo7DPus6FRSprCfROwH6+xLA+pSrEYCmdv1dHMVHst9nm
 PI0y26KMs8Ab1SbheWZRB02JwyM6R8RIE7QdZw/rsNEd8PqSKCBl9Qe90ETW0a580PJE
 /DSgLzBToRolw9uCRUEEhrLWhcHxQQNNsS4mbJuLERBZ6bmlRxeJyXllNzXe2383JmbC
 Kl8C53X0TypFOppXtnFMHzl5uMN4/Wd9Ojoqmpkg6T8UaEy++Eph5rDTwIBANMfJxOcA
 Ti7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZYzhuBZS9rkuOZVHOQsEAGRBl1qfIjePfyvKHgBh4OM=;
 b=sIIOJGg/NLXY4mj/1LKO9yqKaXmJsisTa3Nw1YpTwiGL6vo5a+9cbgZX5gpBiHmD9Y
 SKbhdaQwzz3WOVjtgalu5s8ucufDJkCR7Rzv6PIt9XrZUVb/cpC8G3fGAYD4LCajeMVi
 MVqeNA70zTfsy8hYuF4pNiPtfCh3tsZjMNJ0rQZFwCgxvwrZYsaIlh6I6dlMB5snYaLO
 /F0z+y5RQPnfqXe5TECw2dGeGQ3FQbrp82GiabGHA5AmAOhKJmhZ58nW5XgXVMAwo7n2
 PKEUl24Px8VX5Bi+/oCnJ11jr730ft4sU7g6GQGKGiN5f60guII/BUcpPFuoqTU8yT2H
 jSlw==
X-Gm-Message-State: AOAM532C9gbzOy5k6S3Pr1y+nOy2EafwcB/iGsSmeeWr0G9cp27MsJks
 eBn3wKxkrchpOF0xErpKoAISSw==
X-Google-Smtp-Source: ABdhPJxuN5Wtev05q/gcl9cRRq8T1PFeCRU+R/qg0zNZaGaNLs6k5uX3I52sJpgcqJKmEN5eaWp+bw==
X-Received: by 2002:a05:6214:1925:: with SMTP id
 es5mr5692284qvb.165.1592512613158; 
 Thu, 18 Jun 2020 13:36:53 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id k26sm4684548qtk.55.2020.06.18.13.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 13:36:52 -0700 (PDT)
Message-ID: <5d00735a16728de5547c87e2cf4c29c23a1f0720.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 18 Jun 2020 17:36:50 -0300
In-Reply-To: <CAFd5g45AB8K-p78GRmauRPbkXLU572D2tuMTc0pumL+EgDA52Q@mail.gmail.com>
References: <20200618035736.245566-1-vitor@massaru.org>
 <CAFd5g45AB8K-p78GRmauRPbkXLU572D2tuMTc0pumL+EgDA52Q@mail.gmail.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: fix KconfigParseError by
	ignoring CC_VERSION_TEXT
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

On Thu, 2020-06-18 at 13:29 -0700, Brendan Higgins wrote:
> On Wed, Jun 17, 2020 at 8:57 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> > Commit 8b59cd81dc5 ("kbuild: ensure full rebuild when the compiler
> > is updated") added the environment variable CC_VERSION_TEXT,
> > parse_from_string() doesn't expect a string and this causes the
> > failure below:
> > 
> > [iha@bbking linux]$ tools/testing/kunit/kunit.py run --timeout=60
> > [00:20:12] Configuring KUnit Kernel ...
> > Generating .config ...
> > Traceback (most recent call last):
> >   File "tools/testing/kunit/kunit.py", line 347, in <module>
> >     main(sys.argv[1:])
> >   File "tools/testing/kunit/kunit.py", line 257, in main
> >     result = run_tests(linux, request)
> >   File "tools/testing/kunit/kunit.py", line 134, in run_tests
> >     config_result = config_tests(linux, config_request)
> >   File "tools/testing/kunit/kunit.py", line 64, in config_tests
> >     success = linux.build_reconfig(request.build_dir,
> > request.make_options)
> >   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py",
> > line 161, in build_reconfig
> >     return self.build_config(build_dir, make_options)
> >   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py",
> > line 145, in build_config
> >     return self.validate_config(build_dir)
> >   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py",
> > line 124, in validate_config
> >     validated_kconfig.read_from_file(kconfig_path)
> >   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py",
> > line 89, in read_from_file
> >     self.parse_from_string(f.read())
> >   File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py",
> > line 85, in parse_from_string
> >     raise KconfigParseError('Failed to parse: ' + line)
> > kunit_config.KconfigParseError: Failed to parse:
> > CONFIG_CC_VERSION_TEXT="gcc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-
> > 1)"
> 
> I am pretty there is already a fix out for this issue:
> 
> https://patchwork.kernel.org/patch/11592313/
> 
> Can you confirm?

Sure, thanks!

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
