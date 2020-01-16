Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504D0C33CB3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 09:09:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E117207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E117207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2DA385F9B;
	Thu, 16 Jan 2020 09:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxcOm+h-NnSB; Thu, 16 Jan 2020 09:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 41FF4867AC;
	Thu, 16 Jan 2020 09:09:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3685FC1D82;
	Thu, 16 Jan 2020 09:09:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 556DEC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 09:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51E26835AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 09:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V4ZRcL-sMyr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 09:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43F3E80AE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 09:09:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,325,1574118000"; d="scan'208";a="336003053"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 10:09:19 +0100
Date: Thu, 16 Jan 2020 10:09:18 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161008460.2825@hadrien>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH] parsing_c: Add space for tokens
	after *
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



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> In certain cases, there is no space added after the Pointer type.
> Examples of such cases are * const, * __attr and * const *.
>
> In the Pointer case of pp_type_with_ident_rest and pp_type_left, if
> the * is followed by anything within the type, add a space after the
> printing.

Thank for the patch.  Could you add in a test case as well?

thanks,
julia


>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/pretty_print_c.ml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
> index ccf8214d..a2e35588 100644
> --- a/parsing_c/pretty_print_c.ml
> +++ b/parsing_c/pretty_print_c.ml
> @@ -806,6 +806,8 @@ and pp_string_format (e,ii) =
>            (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
>            pr_elem i;
>            iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          if iiqu <> [] || get_comments_after i <> []
> +          then pr_space();
>            pp_type_with_ident_rest ident t attrs Ast_c.noattr;
>
>        (* ugly special case ... todo? maybe sufficient in practice *)
> @@ -885,6 +887,8 @@ and pp_string_format (e,ii) =
>        | (Pointer t, [i]) ->
>            pr_elem i;
>            iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          if iiqu <> [] || get_comments_after i <> []
> +          then pr_space();
>            pp_type_left t
>
>        | (Array (eopt, t), [i1;i2]) -> pp_type_left t
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
