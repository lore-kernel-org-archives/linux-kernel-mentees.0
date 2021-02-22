Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C4FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 17:49:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F9B64F04
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 17:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F9B64F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A7BF18707D;
	Mon, 22 Feb 2021 17:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K859cmo7CxOb; Mon, 22 Feb 2021 17:49:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8774A8703D;
	Mon, 22 Feb 2021 17:49:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 791FFC000A;
	Mon, 22 Feb 2021 17:49:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 335D9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BCD0857CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfzvSyRPtRK0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:49:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F01685775
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:49:37 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id k2so3631492ili.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqp0KUt/ON1evnwg7CU4+QUDw8az+ViCzd56I6hP/Wc=;
 b=W17mcyu+YOndPMVtSKrSjmwfrfs98z6akzj1XstFlB4wcHb5nrYJdnxodFanCSu3QQ
 uP04tCRq7c4Nu+b1z8GiH4LGAyuCwJObCqkUeRCsGU+Hw+Pjr0mCFSpjYFFjaWeK7kiR
 zJi088KY8ot5bLnMehAk2zCCyOmL+qgjD3uHNZ8jzuBL5Uh4EpQxO32wv6jq/R53E3ty
 mw9s/eP0GduKhzhcHQcgswaWNPvN/f+Qb5PA5ZuDNIW/l4HMaXero8T3UsRa4Zuq/7Dg
 cpbGQZ/66xnKT2Wbu3ZAGQ+PEN/e0bJZrN3BP+rU6Zqt2bnJbp50mUSPqKBMuSmZEklC
 eBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqp0KUt/ON1evnwg7CU4+QUDw8az+ViCzd56I6hP/Wc=;
 b=CZ34abFvc8uU8tH4sb4f1CzU+/MF3SjShcnM0407mTtCGdjhO7k/G6eY8E3SZrUMI/
 FcqX1WjrM7SIhmXr8bUa9fCfvW8WCJorhy9ZVmiC1hXqAqK8fCBglm+07dduw6vnX5fy
 mM45vz4RbOtiSIeCRB4/qC+43W+vFFRMX4rRb3c05mhCJnVYL3CM/Kt0o+hA1YqNaCpe
 FT4smOosTkrk5+y/Z8qf6OVQX9HOycV4/wpT5Q7RWuQ7xV6IYELNDudG90AdEfi+aUk1
 FV2cvEzMpT+FFQ/uQ5lY0ZOabPaXmT+cPZH8KzJk3JI+x0PXACEMglJikEV/FGNt/jJo
 QOlg==
X-Gm-Message-State: AOAM5322DfMMqA+jgeIa1x2tkeNVZ2bAWSJheGLgdvmqpfHkGN9Xl92s
 JFd36Nr5QYAkeF5No2v/+nK2ajVGJt0hHE2A5X0=
X-Google-Smtp-Source: ABdhPJwUGwWSiB2iumLh8m38uhK4i36vjVoxsNoogiIB2dUxtXDyAjHGi0LAlIOPCHJivSlOoqBD3SODfTONl2rsS6E=
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id
 l8mr15940426ilv.251.1614016176735; 
 Mon, 22 Feb 2021 09:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20210222160347.23410-1-yashsri421@gmail.com>
In-Reply-To: <20210222160347.23410-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 22 Feb 2021 18:49:25 +0100
Message-ID: <CAKXUXMz-2TC2oYX2K4ZJOaXpFfaL8e1J87GBj0o-+t_X74Ypyw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix typedef
	support for struct parsing
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

On Mon, Feb 22, 2021 at 5:03 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> There are files in kernel, which use 'typedef struct' syntax for defining
stylistic:
s/in kernel/in the kernel tree/
s/defining struct/defining some struct/
> struct. For eg, include/linux/zstd.h, drivers/scsi/megaraid/mega_common.h,
> etc.

stylistic:
s/For eg/E.g./ or
s/For eg/For example/

semantically:
It makes much more sense to name how many occurrences of this pattern
exist in the kernel tree within how many files in order to get a good
impression on the use of that pattern within the kernel tree.


> However, kernel-doc still does not support it, causing a parsing error.
>
> For eg, running scripts/kernel-doc -none on include/linux/zstd.h emits:
> "error: Cannot parse struct or union!"
>

semantically:
Drop the example and turn the two sentences above into one.

> Add support for parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 8b5bc7bf4bb8..46e904dc3f87 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1201,12 +1201,20 @@ sub dump_union($$) {
>  sub dump_struct($$) {
>      my $x = shift;
>      my $file = shift;
> +    my $decl_type;
> +    my $members;
>
>      if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
> -       my $decl_type = $1;
> +       $decl_type = $1;
>         $declaration_name = $2;
> -       my $members = $3;
> +       $members = $3;
> +    } elsif ($x =~ /typedef\s+(struct|union)\s*\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*\s*(\w*)\s*;/) {
> +       $decl_type = $1;
> +       $declaration_name = $3;
> +       $members = $2;
> +    }
>

Could you put the common expression parts into meaningful variables to
avoid repeating yourself in the two pattern matching expressions?

Other than that, it looks good to me.

Lukas

> +    if ($members) {
>         if ($identifier ne $declaration_name) {
>             print STDERR "${file}:$.: warning: expecting prototype for $decl_type $identifier. Prototype was for $decl_type $declaration_name instead\n";
>             return;
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
