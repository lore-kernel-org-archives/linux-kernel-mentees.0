Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7DCC35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 16:46:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1400020714
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 16:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1400020714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0E3D87397;
	Sun,  9 Feb 2020 16:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tly9S6kl6gvU; Sun,  9 Feb 2020 16:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0878A87347;
	Sun,  9 Feb 2020 16:46:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2523C089F;
	Sun,  9 Feb 2020 16:46:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12C41C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0EC188574F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBm1LckX393E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6BE458574A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:46:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,422,1574118000"; d="scan'208";a="435147169"
Received: from abo-105-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.105])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 17:46:37 +0100
Date: Sun, 9 Feb 2020 17:46:36 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200209153452.11837-2-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2002091745220.3430@hadrien>
References: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
 <20200209153452.11837-2-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v4 1/3] parsing_c: Align C AST
 and Cocci AST for pointer
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

On Sun, 9 Feb 2020, Jaskaran Singh wrote:

> For a pointer, the C parser constructed an AST dissimilar from that
> of the Cocci AST. This caused failures in matching with certain
> pointer types. For example, for the following case:
>
> char *1 const *2 id;
>
> The C AST constructed would be:
> const Pointer1 -> Pointer2 -> char
>
> The Cocci AST constructed would be:
> Pointer2 -> const Pointer1 -> char
>
> Change the pointer rule in the C parser so that an AST similar to the
> Cocci AST is constructed.
>
> Make necessary changes in the C pretty printer so that the pointer type
> is printed correctly.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/parser_c.mly      |  4 ++--
>  parsing_c/pretty_print_c.ml | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
> index 8d7b761e..4c74f15a 100644
> --- a/parsing_c/parser_c.mly
> +++ b/parsing_c/parser_c.mly
> @@ -1333,14 +1333,14 @@ pointer:
>   | tmul                   { (Ast_c.noattr,fun x -> mk_ty (Pointer x) [$1]) }
>   | tmul pointer
>       { let (attr,ptr) = $2 in
> -       (attr,fun x -> mk_ty (Pointer (ptr x)) [$1]) }
> +       (attr,fun x -> ptr (mk_ty (Pointer x) [$1])) }
>   | tmul type_qualif_list
>       { let (attr,tq) = $2 in
>         (attr,fun x -> (tq.qualifD, mk_tybis (Pointer x) [$1]))}
>   | tmul type_qualif_list pointer
>       { let (attr1,tq) = $2 in
>         let (attr2,ptr) = $3 in
> -       (attr1@attr2,fun x -> (tq.qualifD, mk_tybis (Pointer (ptr x)) [$1])) }
> +       (attr1@attr2,fun x -> ptr (tq.qualifD, mk_tybis (Pointer x) [$1])) }
>
>  tmul:
>     TMul { $1 }
> diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
> index a2e35588..3aaa97ca 100644
> --- a/parsing_c/pretty_print_c.ml
> +++ b/parsing_c/pretty_print_c.ml
> @@ -804,11 +804,14 @@ and pp_string_format (e,ii) =
>               (FunctionType (return=void, params=int i) *)
>            (*WRONG I THINK, use left & right function *)
>            (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
> +          pp_type_left t;
>            pr_elem i;
> -          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          iiqu +>
> +          List.iter (* le const est forcement apres le '*' *)
> +            (function x -> (pr_space(); pr_elem x));

There is no need for the parentheses around the pr_space and pr_elem
calls.

>            if iiqu <> [] || get_comments_after i <> []
>            then pr_space();
> -          pp_type_with_ident_rest ident t attrs Ast_c.noattr;
> +          print_ident ident
>
>        (* ugly special case ... todo? maybe sufficient in practice *)
>        | (ParenType ttop, [i1;i2]) ->
> @@ -885,11 +888,14 @@ and pp_string_format (e,ii) =
>        match ty, iity with
>  	(NoType,_) -> failwith "pp_type_left: unexpected NoType"
>        | (Pointer t, [i]) ->
> +          pp_type_left t;
>            pr_elem i;
> -          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          iiqu +>
> +          List.iter (* le const est forcement apres le '*' *)
> +            (function x -> (pr_space(); pr_elem x));
>            if iiqu <> [] || get_comments_after i <> []
>            then pr_space();
> -          pp_type_left t
> +          ()

This is not needed.  YOu can just drop the ; after the pr_space() and the
whole call to pp_type_left.

julia

>
>        | (Array (eopt, t), [i1;i2]) -> pp_type_left t
>        | (FunctionType (returnt, paramst), [i1;i2]) -> pp_type_left returnt
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
