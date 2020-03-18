Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B2CC10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:36:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1102F20780
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1102F20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E860785EE9;
	Wed, 18 Mar 2020 18:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKDJRrm0X-l8; Wed, 18 Mar 2020 18:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BED785BDF;
	Wed, 18 Mar 2020 18:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AC65C18DA;
	Wed, 18 Mar 2020 18:36:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D806DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C743A87553
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nXkv0Wpcwew
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5F030874BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:36:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="441036062"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 19:36:46 +0100
Date: Wed, 18 Mar 2020 19:36:46 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-10-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181936210.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-10-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 09/26] parsing_cocci:
 unparse_ast0: Add cases for ParenType/FunctionType
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



On Mon, 16 Mar 2020, Jaskaran Singh wrote:

> ParenType/FunctionType are now types in the SmPL ASTs. Add
> cases for these types in unparse_ast0.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/unparse_ast0.ml | 43 +++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
> index 5d450e0e..f8684dd2 100644
> --- a/parsing_cocci/unparse_ast0.ml
> +++ b/parsing_cocci/unparse_ast0.ml
> @@ -292,6 +292,40 @@ and print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2) fn =
>    mcode print_string rp1; mcode print_string lp2;
>    parameter_list params; mcode print_string rp2
>
> +and print_parentype (lp,ty,rp) fn =
> + match Ast0.unwrap ty with
> +   Ast0.Pointer(ty1,star) ->
> +     (match Ast0.unwrap ty1 with
> +       Ast0.FunctionType(ty2,lp2,params,rp2) ->
> +         typeC ty2;
> +         mcode print_string lp;
> +         mcode print_string star;
> +         fn();
> +         mcode print_string rp;
> +         mcode print_string lp2;
> +         parameter_list params;
> +         mcode print_string rp2;
> +       | _ -> failwith "ParenType Unparse_ast0")
> + | Ast0.Array(ty1,lb1,size1,rb1) ->
> +     (match Ast0.unwrap ty1 with
> +       Ast0.Pointer(ty2,star) ->
> +         (match Ast0.unwrap ty2 with
> +           Ast0.FunctionType(ty3,lp3,params,rp3) ->
> +             typeC ty3;
> +             mcode print_string lp;
> +             mcode print_string star;
> +             fn();
> +             mcode print_string lb1;
> +             print_option expression size1;
> +             mcode print_string rb1;
> +             mcode print_string rp;
> +             mcode print_string lp3;
> +             parameter_list params;
> +             mcode print_string rp3;

It should be possible to share some code here.

julia

> + 	| _ -> failwith "ParenType Unparse_ast0")
> +     | _ -> failwith "ParenType Unparse_ast0")
> + | _ -> failwith "ParenType Unparse_ast0"
> +
>  and typeC t =
>    print_context t
>      (function _ ->
> @@ -306,6 +340,13 @@ and typeC t =
>        | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
>  	  print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2)
>  	    (function _ -> ())
> +      | Ast0.ParenType(lp,ty,rp) ->
> +          print_parentype (lp,ty,rp) (function _ -> ())
> +      | Ast0.FunctionType(ty,lp,params,rp) ->
> +          typeC ty;
> +          mcode print_string lp;
> +          parameter_list params;
> +          mcode print_string rp
>        | Ast0.Array(ty,lb,size,rb) ->
>  	  typeC ty; mcode print_string lb; print_option expression size;
>  	  mcode print_string rb
> @@ -367,6 +408,8 @@ and print_named_type ty id =
>  		mcode print_string rb)
>  	| _ -> typeC ty; ident id; k () in
>        loop ty (function _ -> ())
> +  | Ast0.ParenType(lp,ty,rp) ->
> +      print_parentype (lp,ty,rp) (function _ -> ident id)
>    | _ -> typeC ty; ident id
>
>  and declaration d =
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
