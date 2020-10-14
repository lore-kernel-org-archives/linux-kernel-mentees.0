Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43342C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:17:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86668212CC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjBsGCRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86668212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB9EF87B4A;
	Wed, 14 Oct 2020 07:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mH1hmiX70kCe; Wed, 14 Oct 2020 07:17:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77D5E87665;
	Wed, 14 Oct 2020 07:17:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A96EC07FF;
	Wed, 14 Oct 2020 07:17:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EA10C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37D158772E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASOospOK0tKh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:17:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7152875FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:17:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t9so2410555wrq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zWbmKsf7IfupN9FPaXSI1lJLjmRLF2ZdDZQcOkrBeJ4=;
 b=XjBsGCRCGL7NkLsW0d6QaMBRXBLLsyTMsWFj2+AaNNpryijP4NwC2NHqgGIWW8tan2
 ENlDexL4OAC491RhF7sljUSuuOWnHZHX9kbiYgsI74OIXGccrmbYu0+5kNkhwqyOKGfg
 PY9+e7SyTwr7l/s9VwE5Sx3P2RlQUTl7RxIi2vsnR3f5am0GBENuNv1I7k08us05EbXl
 cXHiqodFJmNiBgdvZg85oiHYOcJFjwKJh0F0p1PA1IaEjgbJo70B3PMqu7fUULmeFplH
 Z7/IQjSZOrkOihEFvGeBjazQVBRCJharKkLqwY1OkvN60WZtnHN1e62vC2X8I30cqEhJ
 km0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zWbmKsf7IfupN9FPaXSI1lJLjmRLF2ZdDZQcOkrBeJ4=;
 b=jJWpSpCo3i5G7KPhqFc9iLoRcXvBC8gd1B2LL4sNXv5cZssjo1F6U2aAyhyzKw0dLy
 eOesu5BNaPwDh7Y5nye+amymF+/EfS2xmwIv97sVkAbpwcAdsfeE471dIh7dfxtMPJNN
 ZHJQUFkrhFxyhKkVVjWTFloo+Yiz3BTNKVw27H+L4XSrTEl3it9+SeUqGF79XH5SVIjD
 G9rf6w2hyRp5xNs9mk9grwzWr1IGVS9YU43v5KCGgKnQ6C9Mac9GxKsbZFBuTScR2JE4
 NBfRVhZpp1BAYDAG5z56pham60E/rbQnsLJOSK8iO3W4XxGLLpoS9sxd1H88o/+w9F/p
 3G0w==
X-Gm-Message-State: AOAM533eBylRAQPgXbWfwMFkMF4k3vY93n3X3/N51hvtzQYrn2aJ29IU
 8b9zQ8gHrC0wi8Opi9e7Y2o=
X-Google-Smtp-Source: ABdhPJz1bPXTbhaAmSmG7cwvswYL3JoerujxB5UdsEHiq9Ylw4lTfQybWIKjHn+zZiVOnqjCqFEjtw==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr3663436wro.22.1602659822214; 
 Wed, 14 Oct 2020 00:17:02 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id c185sm2328304wma.44.2020.10.14.00.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 00:17:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 09:17:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <084a2dabe5463a3528bb052515555f939235c012.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010140908240.6186@felia>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
 <alpine.DEB.2.21.2010140812370.6186@felia>
 <be7deeec0937327e0ddaadf8468d934ed363a533.camel@perches.com>
 <alpine.DEB.2.21.2010140829150.6186@felia>
 <04325089b524f20d3de167051bfb81b05083d8b1.camel@perches.com>
 <alpine.DEB.2.21.2010140842310.6186@felia>
 <084a2dabe5463a3528bb052515555f939235c012.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Tue, 13 Oct 2020, Joe Perches wrote:

> On Wed, 2020-10-14 at 08:47 +0200, Lukas Bulwahn wrote:
> > 
> > On Tue, 13 Oct 2020, Joe Perches wrote:
> > 
> > > On Wed, 2020-10-14 at 08:36 +0200, Lukas Bulwahn wrote:
> > > > On Tue, 13 Oct 2020, Joe Perches wrote:
> > > > 
> > > > > On Wed, 2020-10-14 at 08:21 +0200, Lukas Bulwahn wrote:
> > > > > > What does checkpatch.pl warn about and what does clang-format still warn 
> > > > > > about, which is generally accepted okay as style in the kernel?
> > > > > 
> > > > > clang-format doesn't warn at all, it just reformats.
> > > > > 
> > > > You can run clang-format with --dry-run and then it would just state the 
> > > > proposed changes, right?
> > > 
> > > clang-format through at least version 10 does not have
> > > a --dry-run option.
> > > 
> > > 
> > 
> > Just a quick check:
> > 
> > version 9 does not have the --dry-run option:
> > 
> > https://releases.llvm.org/9.0.0/tools/clang/docs/ClangFormat.html
> > 
> > version 10 does:
> > 
> > https://releases.llvm.org/10.0.0/tools/clang/docs/ClangFormat.html
> 
> Perhaps some version 10 variants do, but 10.0.0 does not.
> 
> $ which clang-format
> /usr/local/bin/clang-format
> $ clang-format --version
> clang-format version 10.0.0 (git://github.com/llvm/llvm-project.git 305b961f64b75e73110e309341535f6d5a48ed72)
> $ clang-format --dry-run
> clang-format: Unknown command line argument '--dry-run'.  Try: 'clang-format --help'
> clang-format: Did you mean '  --debug'?
>

Hmm... either the documentation is wrong; or the clang-format version 
10.0.0 you are was an early version 10 during development before the 
release and did not have that feature yet? 

$ clang-format-10 --version
Ubuntu clang-format version 
10.0.1-++20200928083909+ef32c611aa2-1~exp1~20200928185400.194

$ clang-format-10 --help | grep 'dry-run'
  --dry-run                  - If set, do not actually make the formatting 
changes
  --ferror-limit=<uint>      - Set the maximum number of clang-format
    errors to emit before stopping (0 = no limit). Used only with --dry-run or -n
  -n                         - Alias for --dry-run


You have probably seen that clang/llvm-11 was released; I guess a good 
motivation for us to update our clang setup? :)

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
