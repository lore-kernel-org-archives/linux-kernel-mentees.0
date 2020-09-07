Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013C3C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 21:08:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8201C2137B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 21:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8201C2137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F57C20117;
	Mon,  7 Sep 2020 21:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBH9wUeYEv3N; Mon,  7 Sep 2020 21:08:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45C8A228B0;
	Mon,  7 Sep 2020 21:08:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2446AC0859;
	Mon,  7 Sep 2020 21:08:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAFE9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B9A1686287
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXSe6trONmuD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 21:08:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0158.hostedemail.com
 [216.40.44.158])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7215886166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 21:08:22 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 87C4318288A2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 20:50:18 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 056CB837F24D;
 Mon,  7 Sep 2020 20:50:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: size37_3508ebd270cf
X-Filterd-Recvd-Size: 4524
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Mon,  7 Sep 2020 20:50:14 +0000 (UTC)
Message-ID: <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Ayush <ayush@disroot.org>, apw@canonical.com
Date: Mon, 07 Sep 2020 13:50:13 -0700
In-Reply-To: <20200907151417.44453-1-ayush@disroot.org>
References: <20200907151417.44453-1-ayush@disroot.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: GIT_COMMIT_ID:
 handle commit messages with multiple quotes
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

On Mon, 2020-09-07 at 20:44 +0530, Ayush wrote:
> Commits which mentioned/referenced "revert commits" in their description will
> get error even if they follow the proper syntax.

I think all your examples are broken.

I think all should start with revert
i.e.: Reverts commit <SHA-1> ("description...")

> for reference:
> commit e8a170ff9a35 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users")
> 
> This patch checks for quotes inside the commit message and adds it
> to $orig_desc.
> 
> Earlier, the script just won't update in case of such commit message.
> I modified old condition and added new conditions to check possible
> patterns.
> 
> Following patters are solved (commit taken as example):
> - commit 193392ed9f69 ("Revert "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")
> 
> - commit 193392ed9f69 ("Revert
> "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")
> 
> - commit 193392ed9f69 ("Revert "drm/amd/display:
> add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")
> 
> - commit 193392ed9f69
> ("Revert "drm/amd/display: add -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines"")
> 
> Signed-off-by: Ayush <ayush@disroot.org>
> ---
>  scripts/checkpatch.pl | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 149518d2a6a7..e90e13b013d3 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2862,23 +2862,42 @@ sub process {
>  				$orig_desc = $1;
>  				$hasparens = 1;
>  			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s*$/i &&
> -				 defined $rawlines[$linenr] &&
> -				 $rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
> +				 defined $rawlines[$linenr]) {
> +				if ($rawlines[$linenr] =~ /^\s*\("([^"]+)"\)/) {
> +					$orig_desc = $1;
> +					$hasparens = 1;
> +				} elsif ($rawlines[$linenr] =~ /^\s*\("([^"]+"[^"]+[^"]")"\)/) {
> +					$orig_desc = $1;
> +					$hasparens = 1;
> +				}
> +			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
> +				 defined $rawlines[$linenr]) {
> +				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
>  				$orig_desc = $1;
> +				if($rawlines[$linenr] =~ /^\s*[^"]+"\)/) {
> +					$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
> +					$orig_desc .= " " . $1;
>  				$hasparens = 1;
> -			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+$/i &&
> +				} elsif ($rawlines[$linenr] =~ /^\s*"[^"]+""\)/) {
> +					$rawlines[$linenr] =~ /^\s*("[^"]+")"\)/;
> +					$orig_desc .= " " . $1;
> +					$hasparens = 1;
> +				}
> +			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+"[^"]+[^"]")"\)/i) {
> +				$orig_desc = $1;
> +			    $hasparens = 1;
> +			} elsif ($line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("[^"]+"[^"]+$/i &&
>  				 defined $rawlines[$linenr] &&
> -				 $rawlines[$linenr] =~ /^\s*[^"]+"\)/) {
> -				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+)$/i;
> +				 $rawlines[$linenr] =~ /^\s*[^"]+""\)/) {
> +				$line =~ /\bcommit\s+[0-9a-f]{5,}\s+\("([^"]+"[^"]+)$/i;
>  				$orig_desc = $1;
> -				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
> +				$rawlines[$linenr] =~ /^\s*([^"]+")"\)/;
>  				$orig_desc .= " " . $1;
>  				$hasparens = 1;
>  			}
>  
>  			($id, $description) = git_commit_info($orig_commit,
>  							      $id, $orig_desc);
> 
>  			if (defined($id) &&
>  			   ($short || $long || $space || $case || ($orig_desc ne $description) || !$hasparens)) {
>  				ERROR("GIT_COMMIT_ID",

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
