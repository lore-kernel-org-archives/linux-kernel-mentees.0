Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400B8C10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139492076D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139492076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2608C809CB;
	Wed, 18 Mar 2020 18:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZbQ4g9LqNV3; Wed, 18 Mar 2020 18:47:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6494A86427;
	Wed, 18 Mar 2020 18:47:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49C74C1D7E;
	Wed, 18 Mar 2020 18:47:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C54C0C18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B21FD24F76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsGBnqpy6Lqh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:47:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by silver.osuosl.org (Postfix) with ESMTPS id 30D08268B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 18:47:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="441037351"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 19:47:04 +0100
Date: Wed, 18 Mar 2020 19:47:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-23-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181946180.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-23-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 22/26] parsing_c: unparse_cocci:
 Print ParenType/FunctionType
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

> The order of the terms in ParenType require implementing a special
> case for ParenType. This case handles only the following:
>
>         <type> ( * id [ .* ] ) ( params )
>
> i.e., a function pointer or an array of function pointers, and will fail
> for any other cases. This is similar to the function used to print
> ParenType in Pretty_print_c.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/unparse_cocci.ml | 60 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
> index 30e755e9..9dd84821 100644
> --- a/parsing_c/unparse_cocci.ml
> +++ b/parsing_c/unparse_cocci.ml
> @@ -722,6 +722,13 @@ and typeC ty =
>    | Ast.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
>        print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2)
>  	(function _ -> ())
> +  | Ast.ParenType(lp,ty,rp) ->
> +      print_parentype (lp,ty,rp) (function _ -> ())
> +  | Ast.FunctionType(ty,lp,params,rp) ->
> +      fullType ty;
> +      mcode print_string lp;
> +      parameter_list params;
> +      mcode print_string rp
>    | Ast.Array(ty,lb,size,rb) ->
>        fullType ty; mcode print_string lb; print_option expression size;
>        mcode print_string rb
> @@ -786,6 +793,57 @@ and storage = function
>    | Ast.Register -> print_string "register"
>    | Ast.Extern -> print_string "extern"
>
> +(* --------------------------------------------------------------------- *)
> +(* ParenType *)
> +
> +and print_parentype (lp,ty,rp) fn =
> +  match Ast.unwrap ty with
> +   Ast.Type(_,_,fty1) ->
> +    (match Ast.unwrap fty1 with
> +      Ast.Pointer(ty1,star) ->
> +       (match Ast.unwrap ty1 with
> +         Ast.Type(_,_,fty2) ->
> +          (match Ast.unwrap fty2 with
> +            Ast.FunctionType(ty2,lp2,params,rp2) ->
> +             fullType ty2;
> +             pr_space();
> +             mcode print_string lp;
> +             mcode print_string star;
> +             fn();
> +             mcode print_string rp;
> +             mcode print_string lp2;
> +             parameter_list params;
> +             mcode print_string rp2
> +         | _ -> failwith "ParenType Unparse_cocci")
> +       | _ -> failwith "ParenType Unparse_cocci")
> +    | Ast.Array(ty1,lb1,size1,rb1) ->
> +       (match Ast.unwrap ty1 with
> +         Ast.Type(_,_,fty2) ->
> +          (match Ast.unwrap fty2 with
> +            Ast.Pointer(ty2,star) ->
> +             (match Ast.unwrap ty2 with
> +               Ast.Type(_,_,fty3) ->
> +                (match Ast.unwrap fty3 with
> +                  Ast.FunctionType(ty3,lp3,params,rp3) ->
> +                  fullType ty3;
> +                  pr_space();
> +                  mcode print_string lp;
> +                  mcode print_string star;
> +                  fn();
> +                  mcode print_string lb1;
> +                  print_option expression size1;
> +                  mcode print_string rb1;
> +                  mcode print_string rp;
> +                  mcode print_string lp3;
> +                  parameter_list params;
> +                  mcode print_string rp3
> +                | _ -> failwith "ParenType Unparse_cocci")
> +             | _ -> failwith "ParenType Unparse_cocci")
> +          | _ -> failwith "ParenType Unparse_cocci")
> +       | _ -> failwith "ParenType Unparse_cocci")
> +    | _ -> failwith "ParenType Unparse_cocci")
> +  | _ -> failwith "ParenType Unparse_cocci"

Can some code be shared?

> +
>  (* --------------------------------------------------------------------- *)
>  (* Variable declaration *)
>
> @@ -818,6 +876,8 @@ and print_named_type ty id =
>  		pretty_print_c.Pretty_print_c.type_with_ident ty
>  		  (function _ -> id())
>              | _ -> error name ty "type value expected")
> +      | Ast.ParenType(lp,ty,rp) ->
> +          print_parentype (lp,ty,rp) (function _ -> id())

Is it normal that there is no FunctionType case here?

julia

>      (*| should have a case here for pointer to array or function type
>          that would put ( * ) around the variable.  This makes one wonder
>          why we really need a special case for function pointer *)
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
