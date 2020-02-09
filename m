Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92194C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 12:18:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB0320733
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 12:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB0320733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EDF4E878EA;
	Sun,  9 Feb 2020 12:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSxPD8WYzj3X; Sun,  9 Feb 2020 12:18:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 065DA8783F;
	Sun,  9 Feb 2020 12:18:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED646C089F;
	Sun,  9 Feb 2020 12:18:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78815C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7024E86132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjmsnB4lWFfZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 12:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0E4D860BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 12:18:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,421,1574118000"; d="scan'208";a="338575184"
Received: from abo-105-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.105])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 13:18:33 +0100
Date: Sun, 9 Feb 2020 13:18:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200209115419.32337-2-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2002091316300.3430@hadrien>
References: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
 <20200209115419.32337-2-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/3] parsing_c: Align C AST
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
>  parsing_c/pretty_print_c.ml | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
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
> index a2e35588..ae02b513 100644
> --- a/parsing_c/pretty_print_c.ml
> +++ b/parsing_c/pretty_print_c.ml
> @@ -804,11 +804,13 @@ and pp_string_format (e,ii) =
>               (FunctionType (return=void, params=int i) *)
>            (*WRONG I THINK, use left & right function *)
>            (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
> +          pp_type_left t;
>            pr_elem i;
> -          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          iiqu +> List.iter (function x ->
> +             (pr_space(); pr_elem x));(* le const est forcement apres le '*' *)

I'm not very fond of this coding style.  I would prefer:

iiqu +>
List.iter (* the comment can go here *)
  (function x -> pr_space(); pr_elem x)

Likewise below.

julia

>            if iiqu <> [] || get_comments_after i <> []
>            then pr_space();
> -          pp_type_with_ident_rest ident t attrs Ast_c.noattr;
> +          print_ident ident
>
>        (* ugly special case ... todo? maybe sufficient in practice *)
>        | (ParenType ttop, [i1;i2]) ->
> @@ -885,11 +887,13 @@ and pp_string_format (e,ii) =
>        match ty, iity with
>  	(NoType,_) -> failwith "pp_type_left: unexpected NoType"
>        | (Pointer t, [i]) ->
> +          pp_type_left t;
>            pr_elem i;
> -          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          iiqu +> List.iter (function x ->
> +             (pr_space(); pr_elem x));(* le const est forcement apres le '*' *)
>            if iiqu <> [] || get_comments_after i <> []
>            then pr_space();
> -          pp_type_left t
> +          ()
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
