Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7903DC10F29
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE1520753
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE1520753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8D4787E0A;
	Wed, 18 Mar 2020 17:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22S3FdJVmQ-X; Wed, 18 Mar 2020 17:42:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA0C187DF2;
	Wed, 18 Mar 2020 17:42:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3EB4C07FE;
	Wed, 18 Mar 2020 17:42:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A16AC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 17:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58819203CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 17:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ByzrpLDJND9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 17:42:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by silver.osuosl.org (Postfix) with ESMTPS id E843E203C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 17:42:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="342839651"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 18:42:28 +0100
Date: Wed, 18 Mar 2020 18:42:28 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-5-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181835590.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-5-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 04/26] parsing_cocci:
 visitor_ast0: Add cases for ParenType/FunctionType
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
> 	<type> ( * id [ .* ] ) ( params )
>
> i.e., a function pointer or an array of function pointers, and will fail
> for any other cases. This is similar to the function used to print
> ParenType in Pretty_print_c.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/visitor_ast0.ml | 163 ++++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
>
> diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
> index c282e1f8..c56cd7a7 100644
> --- a/parsing_cocci/visitor_ast0.ml
> +++ b/parsing_cocci/visitor_ast0.ml
> @@ -339,6 +339,12 @@ let visitor mode bind option_default
>  	| Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
>  	    let (t,id) =
>                function_pointer (ty,lp1,star,None,rp1,lp2,params,rp2) in t
> +        | Ast0.ParenType(lp,ty,rp) ->
> +	    let (t,id) =
> +              parentype_type (lp,ty,None,rp) in t
> +        | Ast0.FunctionType(ty,lp,params,rp) ->
> +	    let (t,id) =
> +              functiontype_type (ty,None,lp,params,rp) in t
>  	| Ast0.Array(ty,lb,size,rb) ->
>              let (t,id) = array_type (ty,None,lb,size,rb) in t
>  	| Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
> @@ -435,6 +441,76 @@ let visitor mode bind option_default
>      ((multibind ([ty_n] @ idl @ [lb_n;size_n;rb_n]),
>       Ast0.Array(ty,lb,size,rb)), idu)
>
> +  and parentype_type (lp,ty,(id : Ast0.ident option),rp) =
> +    match Ast0.unwrap ty with
> +      Ast0.Pointer(ty1,star) ->
> +        (match Ast0.unwrap ty1 with
> +          Ast0.FunctionType(ty2,lp2,params,rp2) ->
> +            let (ty_n,typ) = typeC ty2 in
> +            let (lp_n,lp) = string_mcode lp in
> +            let (star_n,star) = string_mcode star in
> +            let (idl,idu) = (match id with

I would prefer the match on a line by itself.  It doesn't need parentheses
around it.  (Even though I see that some other code has done it the way
you do it here).

> +              | Some a -> let (b,c) = ident a in ([b],Some c)
> +              | None -> ([],None)) in
> +            let (rp_n,rp) = string_mcode rp in
> +            let (lp2_n,lp2) = string_mcode lp2 in
> +            let (params_n,params) = parameter_dots params in
> +            let (rp2_n,rp2) = string_mcode rp2 in
> +            ((multibind ([ty_n;lp_n;star_n] @ idl @
> +              [rp_n;lp2_n;params_n;rp2_n]),
> +               Ast0.ParenType
> +                 (lp,
> +                  Ast0.rewrap ty1 (Ast0.Pointer
> +                   (Ast0.rewrap ty2 (Ast0.FunctionType
> +                     (typ,lp2,params,rp2)),star)),rp)), idu)
> +	| _ -> failwith "ParenType Visitor_ast0")
> +    | Ast0.Array(ty1,lb1,size1,rb1) ->
> +        (match Ast0.unwrap ty1 with
> +          Ast0.Pointer(ty2,star) ->
> +            (match Ast0.unwrap ty2 with
> +              Ast0.FunctionType(ty3,lp3,params,rp3) ->
> +                let (ty_n,typ) = typeC ty3 in
> +                let (lp_n,lp) = string_mcode lp in
> +                let (star_n,star) = string_mcode star in
> +                let (idl,idu) = (match id with
> +                  | Some a -> let (b,c) = ident a in ([b],Some c)
> +                  | None -> ([],None)) in
> +                let (lb1_n,lb1) = string_mcode lb1 in
> +                let (size_n,size1) = get_option expression size1 in
> +                let (rb1_n,rb1) = string_mcode rb1 in
> +                let (rp_n,rp) = string_mcode rp in
> +                let (lp3_n,lp3) = string_mcode lp3 in
> +                let (params_n,params) = parameter_dots params in
> +                let (rp3_n,rp3) = string_mcode rp3 in
> +                ((multibind ([ty_n;lp_n;star_n] @ idl @
> +                  [lb1_n;size_n;rb1_n;rp_n;lp3_n;params_n;rp3_n]),
> +                   Ast0.ParenType
> +                     (lp,
> +                      Ast0.rewrap ty1
> +                       (Ast0.Array
> +                         (Ast0.rewrap ty2
> +                           (Ast0.Pointer
> +                             (Ast0.rewrap ty3
> +                               (Ast0.FunctionType(typ,lp3,params,rp3)),
> +                              star)),
> +                        lb1,size1,rb1)),
> +                   rp)),
> +                 idu)
> +    	    | _ -> failwith "ParenType Visitor_ast0")
> +        | _ -> failwith "ParenType Visitor_ast0")
> +    | _ -> failwith "ParenType Visitor_ast0"

Can some code be shared between the above two cases?

> +  and functiontype_type (ty,(id : Ast0.ident option),lp,params,rp) =
> +    let (ty_n,ty) = typeC ty in
> +    let (idl,idu) = (match id with
> +      | Some a -> let (b,c) = ident a in ([b],Some c)
> +      | None -> ([],None)) in
> +    let (lp_n,lp) = string_mcode lp in
> +    let (params_n,params) = parameter_dots params in
> +    let (rp_n,rp) = string_mcode rp in
> +    ((multibind ([ty_n] @ idl @ [lp_n; params_n; rp_n]),
> +     Ast0.FunctionType(ty,lp,params,rp)), idu)
> +
>    and named_type ty id =
>      match Ast0.unwrap ty with
>        Ast0.FunctionPointer(rty,lp1,star,rp1,lp2,params,rp2) ->
> @@ -446,6 +522,14 @@ let visitor mode bind option_default
>  	let (tyres, idn) = array_type (rty,Some id,lb,size,rb) in
>          let idn = match idn with Some i -> i | None -> failwith "Impossible" in
>  	(rewrap ty tyres, idn)
> +    | Ast0.ParenType(lp,rty,rp) ->
> +	let (tyres, idn) = parentype_type (lp,rty,Some id,rp) in
> +        let idn = match idn with Some i -> i | None -> failwith "Impossible" in
> +	(rewrap ty tyres, idn)
> +    | Ast0.FunctionType(rty,lp,params,rp) ->
> +	let (tyres, idn) = functiontype_type (rty,Some id,lp,params,rp) in
> +        let idn = match idn with Some i -> i | None -> failwith "Impossible" in
> +	(rewrap ty tyres, idn)

The second let is using spaces instead of a tab in each case.  The code
above has the same problem.  No need to modify the code above, but the new
code could use the tabs.

>      | _ -> let (ty_n,ty) = typeC ty in
>             let (id_n,id) = ident id in
>               ((bind ty_n id_n, ty), id)
> @@ -479,6 +563,77 @@ let visitor mode bind option_default
>      ((multibind ([ty_n] @ idl @ [lb_n;size_n;rb_n]),
>       Ast0.Array(ty,lb,size,rb)), idu)
>
> +  (* returns ((bind value,original value),id) since id may have been updated*)
> +  and parentype_typedef (lp,ty,id,rp) =
> +    match Ast0.unwrap ty with
> +      Ast0.Pointer(ty1,star) ->
> +        (match Ast0.unwrap ty1 with
> +          Ast0.FunctionType(ty2,lp2,params,rp2) ->
> +            let (ty_n,typ) = typeC ty2 in
> +            let (lp_n,lp) = string_mcode lp in
> +            let (star_n,star) = string_mcode star in
> +            let (idl,idu) = (match id with
> +              | Some a -> let (b,c) = typeC a in ([b],Some c)
> +              | None -> ([],None)) in
> +            let (rp_n,rp) = string_mcode rp in
> +            let (lp2_n,lp2) = string_mcode lp2 in
> +            let (params_n,params) = parameter_dots params in
> +            let (rp2_n,rp2) = string_mcode rp2 in
> +            ((multibind ([ty_n;lp_n;star_n] @ idl @
> +              [rp_n;lp2_n;params_n;rp2_n]),
> +               Ast0.ParenType
> +                 (lp,
> +                  Ast0.rewrap ty1 (Ast0.Pointer
> +                   (Ast0.rewrap ty2 (Ast0.FunctionType
> +                     (typ,lp2,params,rp2)),star)),rp)), idu)
> +	| _ -> failwith "ParenType Visitor_ast0")
> +    | Ast0.Array(ty1,lb1,size1,rb1) ->
> +        (match Ast0.unwrap ty with
> +          Ast0.Pointer(ty2,star) ->
> +            (match Ast0.unwrap ty1 with
> +              Ast0.FunctionType(ty3,lp3,params,rp3) ->
> +                let (ty_n,typ) = typeC ty3 in
> +                let (lp_n,lp) = string_mcode lp in
> +                let (star_n,star) = string_mcode star in
> +                let (idl,idu) = (match id with
> +                  | Some a -> let (b,c) = typeC a in ([b],Some c)
> +                  | None -> ([],None)) in
> +                let (lb1_n,lb1) = string_mcode lb1 in
> +                let (size_n,size1) = get_option expression size1 in
> +                let (rb1_n,rb1) = string_mcode rb1 in
> +                let (rp_n,rp) = string_mcode rp in
> +                let (lp3_n,lp3) = string_mcode lp3 in
> +                let (params_n,params) = parameter_dots params in
> +                let (rp3_n,rp3) = string_mcode rp3 in
> +                ((multibind ([ty_n;lp_n;star_n] @ idl @
> +                  [lb1_n;size_n;rb1_n;rp_n;lp3_n;params_n;rp3_n]),
> +                   Ast0.ParenType
> +                     (lp,
> +                      Ast0.rewrap ty1
> +                       (Ast0.Array
> +                         (Ast0.rewrap ty2
> +                           (Ast0.Pointer
> +                             (Ast0.rewrap ty3
> +                               (Ast0.FunctionType(typ,lp3,params,rp3)),
> +                              star)),
> +                        lb1,size1,rb1)),
> +                   rp)),
> +                 idu)
> +    	    | _ -> failwith "ParenType Visitor_ast0")
> +        | _ -> failwith "ParenType Visitor_ast0")
> +    | _ -> failwith "ParenType Visitor_ast0"

Again, can some code be shared?

julia


> +
> +  and functiontype_typedef (ty,id,lp,params,rp) =
> +    let (ty_n,ty) = typeC ty in
> +    let (idl,idu) = (match id with
> +      | Some a -> let (b,c) = typeC a in ([b],Some c)
> +      | None -> ([],None)) in
> +    let (lp_n,lp) = string_mcode lp in
> +    let (params_n,params) = parameter_dots params in
> +    let (rp_n,rp) = string_mcode rp in
> +    ((multibind ([ty_n] @ idl @ [lp_n; params_n; rp_n]),
> +     Ast0.FunctionType(ty,lp,params,rp)), idu)
> +
>    and named_type_typedef ty id =
>      match Ast0.unwrap ty with
>        Ast0.FunctionPointer(rty,lp1,star,rp1,lp2,params,rp2) ->
> @@ -490,6 +645,14 @@ let visitor mode bind option_default
>  	let (tyres, idn) = array_type_typedef (rty,Some id,lb,size,rb) in
>          let idn = match idn with Some i -> i | None -> failwith "Impossible" in
>  	(rewrap ty tyres, idn)
> +    | Ast0.ParenType(lp,rty,rp) ->
> +	let (tyres, idn) = parentype_typedef (lp,rty,Some id,rp) in
> +        let idn = match idn with Some i -> i | None -> failwith "Impossible" in
> +	(rewrap ty tyres, idn)
> +    | Ast0.FunctionType(rty,lp,params,rp) ->
> +	let (tyres, idn) = functiontype_typedef (rty,Some id,lp,params,rp) in
> +        let idn = match idn with Some i -> i | None -> failwith "Impossible" in
> +	(rewrap ty tyres, idn)
>      | _ -> let (ty_n,ty) = typeC ty in
>             let (id_n,id) = typeC id in
>               ((bind ty_n id_n, ty), id)
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
