Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE9EC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 17:09:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558F720738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 17:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558F720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3216987EA1;
	Mon, 27 Apr 2020 17:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZvq4Sviyp0G; Mon, 27 Apr 2020 17:09:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD7F587E9D;
	Mon, 27 Apr 2020 17:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B71B2C18DC;
	Mon, 27 Apr 2020 17:09:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD83EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AC8D387EA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8ngJzqZ9MHE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:09:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CAE8187E9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:09:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347098204"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:09:16 +0200
Date: Mon, 27 Apr 2020 19:09:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-13-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271907590.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-13-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 12/23] parsing_cocci:
 unparse_ast0: Reflect Parameter attributes
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



On Mon, 27 Apr 2020, Jaskaran Singh wrote:

> Parameter attributes are added to the SmPL AST. Reflect these changes in
> unparse_ast0.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/unparse_ast0.ml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
> index fdaf6cfa..738549fd 100644
> --- a/parsing_cocci/unparse_ast0.ml
> +++ b/parsing_cocci/unparse_ast0.ml
> @@ -546,9 +546,18 @@ and parameterTypeDef p =
>    print_context p
>      (function _ ->
>        match Ast0.unwrap p with
> -	Ast0.VoidParam(ty) -> typeC ty
> -      | Ast0.Param(ty,Some id) -> print_named_type ty id
> -      |	Ast0.Param(ty,None) -> typeC ty
> +        Ast0.VoidParam(ty,attr) ->
> +          typeC ty;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
> +      | Ast0.Param(ty,Some id,attr) ->
> +          print_named_type ty id;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
> +      |	Ast0.Param(ty,None,attr) ->
> +          typeC ty;
> +	  (if (attr = []) then print_string " ");
> +	  print_between (fun _ -> print_string " ") (mcode print_string) attr;

There is some unpleasant alignment in the code above.  After the | there
should be a space not a tab, and the subsequent lines should use tabs if
possible.  You didn't introduce these problems, but since you are changing
these lines, you may as well make these changes as well.

julia

>        | Ast0.MetaParam(name,_,_) -> mcode print_meta name
>        | Ast0.MetaParamList(name,_,_,_) -> mcode print_meta name
>        | Ast0.PComma(cm) -> mcode print_string cm; print_space()
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
